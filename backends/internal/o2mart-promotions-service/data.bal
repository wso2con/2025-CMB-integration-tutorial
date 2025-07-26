// Sample in-memory data
final map<Promotion[]> & readonly promotionsByTier = {
    BRONZE: [],
    SILVER: [
        {productId: "P1005", percentage: 3, ends: "2025-08-03"}
    ],
    GOLD: [
        {productId: "P1001", percentage: 10, ends: "2025-08-01"},
        {productId: "P1005", percentage: 5, ends: "2025-08-04"}
    ],
    PLATINUM: [
        {productId: "P1001", percentage: 15, ends: "2025-08-01"},
        {productId: "P1005", percentage: 7, ends: "2025-08-04"},
        {productId: "P1008", percentage: 5, ends: "2025-08-10"}
    ]
};
