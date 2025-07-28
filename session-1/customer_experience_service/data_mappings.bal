import customer_experience_service.promos;

function transformPromotion(promos:Promotion promotion, Product product) returns PromotionsItem|error => {
    productId: promotion.productId,
    originalPrice: product.price,
    validUntil: "Until " + promotion.ends,
    label: product.name + " - " + promotion.percentage.toString() + "% OFF!",
    discountedPrice: product.price * (100 - promotion.percentage) / 100
};
