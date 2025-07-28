import ballerina/test;

import o2mart/customer_experience_service.promos;

@test:Config
function testFormatDate() {
    do {
        promos:Promotion promotionVal = {productId: "P1011", percentage: 5, ends: "2025-08-04"};
        Product productVal = {name: "PureHarvest Extra Virgin Olive Oil 1L ", price: 10, stock: 40, id: "P1011"};
        PromotionsItem promotionsItem = check transformPromotion(promotionVal, productVal);
        PromotionsItem expected = {
            "productId": "P1011",
            "label": "PureHarvest Extra Virgin Olive Oil 1L  - 5% OFF!",
            "originalPrice": 10,
            "discountedPrice": 9.5,
            "validUntil": "Until August 4"
        };
        test:assertEquals(promotionsItem, expected);

    } on fail error err {
    }
}
