import ballerina/test;

@test:Config
function testGetLoyaltyLevel() {
    do {
        test:assertEquals(getLoyaltyTier(999), BRONZE);
        test:assertEquals(getLoyaltyTier(2999), SILVER);
        test:assertEquals(getLoyaltyTier(4999), GOLD);
        test:assertEquals(getLoyaltyTier(5000), PLATINUM);
    } on fail error err {
    }
}
