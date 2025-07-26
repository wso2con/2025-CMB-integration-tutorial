
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

type Feedback record {|
    string orderId;
    string feedback;
|};

type FeedbackAnalysis record {|
    # One of positive, negative, or neutral
    string sentiment;
    # Applicable categories out of product quality, packaging, and/or delivery
    string categories;
|};
