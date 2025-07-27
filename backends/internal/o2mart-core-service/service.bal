import ballerina/http;

service /o2martcore on new http:Listener(8080) {

    resource function get customers() returns table<Customer> {
        lock {
            return customers.clone();
        }
    }

    resource function get customers/[string customerId]() returns Customer|http:NotFound {
        lock {
            if customers.hasKey(customerId) {
                return customers.get(customerId).clone();
            }
        }
        return http:NOT_FOUND;
    }

    resource function post customers(Customer customer) returns http:Created {
        lock {
            customers.add(customer.clone());
        }
        return http:CREATED;
    }

    resource function get orders() returns table<Order> {
        lock {
            return orders.clone();
        }
    }

    resource function get orders/[string orderId]() returns Order|http:NotFound {
        lock {
            if orders.hasKey(orderId) {
                return orders.get(orderId).clone();
            }
        }
        return http:NOT_FOUND;
    }

    resource function post orders(Order 'order) returns http:Created {
        lock {
            orders.add('order.clone());
        }
        return http:CREATED;
    }

    resource function get products(string[]? productIds = ()) returns xml|http:NotFound {
        lock {
            if productIds is () {
                return xml `<products>${productsData.clone()}</products>`;
            }
            
            xml<xml:Element> filtered = from string productId in productIds.clone()
                    join xml:Element product in productsData.elements()
                    on productId equals product.getAttributes().get("id")
                    select product;
            if filtered.length() != productIds.length() {
                return <http:NotFound>{body: xml `<error>One or more products not found</error>`};
            }
            return xml `<products>${filtered.clone()}</products>`;
        }
    }

    resource function get products/[string productId]() returns xml|http:NotFound {
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
