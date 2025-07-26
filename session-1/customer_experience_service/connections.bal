import customer_experience_service.promos;

import ballerina/ai;
import ballerina/http;
import ballerinax/googleapis.gmail;

final http:Client backend = check new ("http://localhost:8080");

final promos:Client promosConnection = check new ();
final ai:Wso2ModelProvider mp = check ai:getDefaultModelProvider();
final gmail:Client gmailClient = check new ({
    auth: {
        refreshToken: refreshToken,
        clientId: clientId,
        clientSecret
    }
});
