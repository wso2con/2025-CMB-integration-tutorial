// Mock service for products.
import ballerina/http;

configurable int port = 8080;

service /products on new http:Listener(port) {

    resource function get .(string[]? productIds = ()) returns xml|http:NotFound {
        lock {
            if productIds is () {
                return xml `<products>${productsData.clone()}</products>`;
            }
            xml<xml:Element> filtered = from xml:Element product in productsData.elements()
                let string productId = product.getAttributes().get("id")
                where productIds.some(id => id == productId)
                select product;
            if filtered.length() != productIds.length() {
                return <http:NotFound>{body: xml `<error>One or more products not found</error>`};
            }
            return xml `<products>${filtered.clone()}</products>`;
        }
    }

    resource function get [string productId]() returns xml|http:NotFound {
        lock {
            xml:Element[] matchingProducts = from xml:Element product in productsData.elements()
                where product.getAttributes().get("id") == productId
                select product;

            if matchingProducts.length() == 0 {
                return <http:NotFound>{body: xml `<error>Product not found</error>`};
            }

            return matchingProducts[0].clone();
        }
    }

    resource function post products(xml:Element product) returns http:Created {
        lock {
            productsData = <xml<xml:Element|xml:Text>>xml:concat(productsData.clone(), product.clone());
        }
        return http:CREATED;
    }
}
