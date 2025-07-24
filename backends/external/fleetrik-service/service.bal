import ballerina/http;

configurable int port = 8082;

type TrackingResponse record {
    string trackingId;
    ShippingStatus status;
};

enum ShippingStatus {
    PENDING = "Pending",
    IN_TRANSIT = "In Transit",
    DELIVERED = "Delivered"
}

service /fleetrik on new http:Listener(port) {

    resource function get [string trackingId]() returns TrackingResponse|http:NotFound {
        lock {
            if trackingData.hasKey(trackingId) {
                return {
                    trackingId,
                    status: trackingData.get(trackingId)
                };
            } 
        }
        return http:NOT_FOUND;
    }
}
