import ballerina/http;
import ballerina/mime;

listener http:Listener promotionsListener = new (port = 9090);

service /o2martpromotions on promotionsListener {
    resource function get promotions(int loyalty) returns @http:Payload {mediaType: mime:APPLICATION_JSON} Promotion[] {
        do {
            LoyaltyTier loyaltyTier = getLoyaltyTier(loyalty);
            return promotionsByTier.get(loyaltyTier);
        } on fail error err {

            // 
            // Don't need this, but can't get rid of the on fail block

            return [];
        }
    }

}
