import ballerina/test;

import maryamm/customer_experience_service.promos;

@test:Config
function testPromotionsMapping() {
    do {
        Product product = {name: "PureHarvest Extra Virgin Olive Oil 1L ", price: 10, stock: 40, id: "P1011"};
        promos:Promotion promotion = {productId: "P1011", percentage: 5, ends: "2025-08-04"};
        PromotionsResultItem promotionsResultItem = check transformPromotion(promotion, product);
        PromotionsResultItem expected = {
            "productId": "P1011",
            "label": "PureHarvest Extra Virgin Olive Oil 1L  - 5% OFF!",
            "originalPrice": 10,
            "discountedPrice": 9.5,
            "validUntil": "Until August 4"
        };
        test:assertEquals(promotionsResultItem, expected);

    } on fail error err {
    }
}
