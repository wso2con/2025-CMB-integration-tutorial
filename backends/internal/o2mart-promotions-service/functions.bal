function getLoyaltyTier(int points) returns LoyaltyTier {
    if points < 1000 {
        return BRONZE;
    } else if points < 3000 {
        return SILVER;
    } else if points < 5000 {
        return GOLD;
    } else {
        return PLATINUM;
    }
}
