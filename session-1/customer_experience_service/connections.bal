import customer_experience_service.promos;

import ballerina/http;

final http:Client backend = check new ("http://localhost:8080");

final promos:Client promosConnection = check new ();
