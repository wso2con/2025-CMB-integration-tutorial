
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

type Feedback record {|
    string orderId;
    string feedback;
|};

enum Sentiment {
    NEGATIVE,
    NEUTRAL,
    POSITIVE
}

type FeedbackAnalysis record {|
    # The sentiment of the feedback
    Sentiment sentiment;
    # Comma separated list of applicable categories out of product quality, packaging, and/or delivery
    string categories;
    # Comma separated list of applicable product(s)
    string products;
|};
