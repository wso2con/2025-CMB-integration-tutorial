
type Promotion record {|
    string productId;
    int percentage;
    string ends;
|};

enum LoyaltyTier {
    BRONZE,
    SILVER,
    GOLD,
    PLATINUM
}

type PromotionsItem record {|
    string id;
    int percentage;
    string ends;
|};

type Promotions PromotionsItem[];

