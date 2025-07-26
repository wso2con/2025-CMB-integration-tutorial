import customer_experience_service.promos;

import ballerina/http;

final http:Client backend = check new ("http://localhost:8080");
final http:Client fleetrik = check new ("http://localhost:8082");

final promos:Client promosConnection = check new ();
