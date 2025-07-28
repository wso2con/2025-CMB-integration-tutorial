import ballerina/data.xmldata;
import ballerina/http;
import ballerina/lang.array;
import ballerina/log;

import o2mart/customer_experience_service.promos;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /o2mart on httpDefaultListener {
    resource function get promotions(string customerId) returns Promotions|http:InternalServerError|error {
        do {
            Customer customer = check coreBackendConnection->get(string `/customers/${customerId}`);
            int loyaltyPoints = customer.loyalty.points;
            promos:Promotion[] promosDetails = check promosConnection->/promotions.get(loyalty = loyaltyPoints);
            Promotions promotions = [];
            foreach promos:Promotion promoDetails in promosDetails {
                xml productXml = check coreBackendConnection->get(string `/products/${promoDetails.productId}`);
                Product product = check xmldata:parseAsType(productXml);
                PromotionsItem promotionsItem = check transformPromotion(promoDetails, product);

                array:push(promotions, promotionsItem);

            }
            return promotions;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post feedback(@http:Payload Feedback payload) returns error|json {
        do {
            FeedbackAnalysis feedbackAnalysis = check model->generate(`Analyze the sentiment of the following customer feedback for an order and extract relevant details: ${payload.feedback}`);
            if feedbackAnalysis.sentiment == NEGATIVE {
                log:printInfo("Negative feedback received: " + payload.feedback, orderId = payload.orderId, products = feedbackAnalysis.products, categories = feedbackAnalysis.categories);
            } else {
                log:printInfo("Received positive or neutral feedback: " + payload.feedback);
            }
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
