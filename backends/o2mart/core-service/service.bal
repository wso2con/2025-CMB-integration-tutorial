import ballerina/http;

configurable int port = 8081;

service /core on new http:Listener(port) {

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

    resource function post customers(Customer customer) returns http:Created {
        lock {
            customers.add(customer.clone());
        }
        return http:CREATED;
    }

    resource function post orders(Order 'order) returns http:Created {
        lock {
            orders.add('order.clone());
        }
        return http:CREATED;
    }
}
