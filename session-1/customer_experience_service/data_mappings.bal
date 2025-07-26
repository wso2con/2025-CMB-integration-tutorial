import customer_experience_service.promos;

function extractProductIds(promos:Promotion[] items) returns string[] => from var itemsItem in items
    select itemsItem.productId;

function transformPromotion(promos:Promotion promotion, Product product) returns PromotionsResultItem|error => {
    productId: promotion.productId,
    originalPrice: product.price,
    validUntil: "Until " + check formatDateToWords(promotion.ends),
    label: product.name + " - " + promotion.percentage.toString() + "% OFF!",
    discountedPrice: product.price * (100 - promotion.percentage) / 100
};

