// Mock service for products.
import ballerina/http;

configurable int port = 8080;

service /products on new http:Listener(port) {

    resource function get .() returns xml {
        lock {
            return productsData.clone();
        }
    }

    resource function get [string productId]() returns xml|http:NotFound {
        lock {
            xml:Element[] matchingProducts = from xml:Element|xml:Text product in productsData
                where product is xml:Element && product.getAttributes().get("id") == productId
                select product;
                
            if matchingProducts.length() == 0 {
                return <http:NotFound>{body: xml `<error>Product not found</error>`}; 
            }
            
            return matchingProducts[0].clone();
        }
    }

    resource function post products(xml:Element product) returns http:Created {
        lock {
            productsData = <xml<xml:Element|xml:Text>> xml:concat(productsData.clone(), product.clone());
        }
        return http:CREATED;
    }
}
