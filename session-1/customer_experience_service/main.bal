import ballerina/ai as _; // Temp workaround for `generate` issue
import ballerina/data.xmldata;
import ballerina/http;
import ballerina/lang.array;
import ballerina/log;
import ballerinax/googleapis.gmail;

import maryamm/customer_experience_service.promos;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /o2mart on httpDefaultListener {

    resource function get promotions(string customerId) returns error|PromotionsResult {
        do {
            Customer customerDetails = check backend->get(string `/customers/${customerId}`);
            int loyaltyPoints = customerDetails.loyalty.points;
            promos:Promotion[] promosForCustomer = check promosConnection->/promotions.get(loyalty = loyaltyPoints);

            PromotionsResultItem[] promotionsResultItems = [];

            foreach promos:Promotion promotion in promosForCustomer {
                xml productXml = check backend->get(string `/products/${promotion.productId}`);
                Product product = check xmldata:parseAsType(productXml);
                PromotionsResultItem promotionsResultItem = check transformPromotion(promotion, product);
                array:push(promotionsResultItems, promotionsResultItem);
            }
            return promotionsResultItems;

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post feedback(@http:Payload Feedback payload) returns string|error {
        do {
            string feedback = payload.feedback;
            FeedbackAnalysis feedbackAnalysis = check mp->generate(`Analyze the sentiment of the following customer feedback for an order. ${feedback}`);
            string sentimentValue = feedbackAnalysis.sentiment;
            if sentimentValue.equalsIgnoreCaseAscii("negative") {
                gmail:Message gmailMessage = check gmailClient->/users/["me"]/messages/send.post({
                    to: [emailRecipient],
                    subject: string `Received negative feedack for order '${payload.orderId}'`,
                    bodyInText: string `Received negative feedack for order '${payload.orderId}'.
	
	Feedback: ${feedback}
	Categories: ${feedbackAnalysis.categories}
	Products: ${feedbackAnalysis.products}
	`
                });
                log:printInfo("Received negative feedback", feedback = feedback, aiAnalysis = feedbackAnalysis, orderId = payload.orderId);
            } else {
                log:printInfo("Received non-negative feedback", feedback = feedback, aiAnalysis = feedbackAnalysis, orderId = payload.orderId);
            }
            return "Feedback submitted succesfully";
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
