type Loyalty record {
    int points;
    string expiryDate;
};

type Customer record {
    readonly string id;
    string name;
    string email;
    string phone;
    Loyalty loyalty;
};

type OrderItem record {
    string productId;
    int quantity;
};

type Order record {
    readonly string id;
    string customerId;
    OrderItem[] items;
    float total;
    string trackingId?;
};
