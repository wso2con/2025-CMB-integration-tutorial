
import ballerina/http;
import ballerina/lang.array;

import maryamm/customer_experience_service.promos;
import ballerina/data.xmldata;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /o2mart on httpDefaultListener {

    resource function get deliveries(string orderId) returns string|http:NotFound {
        do {
            Order orderRes = check backend->get(string `/orders/${orderId}`);
            string? trackingId = orderRes.trackingId;
            if trackingId is () {
                fail error("Tracking ID not found for order: " + orderId);
            }

            // If trackingId is present, return it
            TrackingResponse trackingResponse = check fleetrik->get(string `/${trackingId}`);
            return trackingResponse.status;
        } on fail error err {
            // handle error
            return {body: "Not found"};
        }
    }

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
}
