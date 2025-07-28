
type PromotionsItem record {|
    string productId;
    string label;
    decimal originalPrice;
    decimal discountedPrice;
    string validUntil;
|};

type Promotions PromotionsItem[];

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
