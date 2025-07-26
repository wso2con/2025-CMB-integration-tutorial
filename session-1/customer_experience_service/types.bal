
type ItemsItem record {|
    string productId;
    int quantity;
|};

type Items ItemsItem[];

type Order record {|
    string id;
    string customerId;
    Items items;
    decimal total;
    string trackingId?;
|};

type TrackingResponse record {
    string trackingId;
    string status;
};

type PromotionsResultItem record {|
    string productId;
    string label;
    decimal originalPrice;
    decimal discountedPrice;
    string validUntil;
|};

type PromotionsResult PromotionsResultItem[];

type Loyalty record {|
    int points;
    string expiryDate;
|};

type Customer record {|
    string id;
    string name;
    string email;
    string phone;
    Loyalty loyalty;
|};

type Product record {
    string name;
    decimal price;
    int stock;
    string id;
};

type Products record {
    Product[] product;
};

type Promotion record {|
    string productId;
    int percentage;
    string ends;
|};

