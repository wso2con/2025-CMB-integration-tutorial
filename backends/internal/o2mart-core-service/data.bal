// Sample in-memory data
isolated xml<xml:Element|xml:Text> productsData = xml `<product id="P1001">
        <name>Mooberry Whole Milk 1L</name>
        <price>2.49</price>
        <stock>120</stock>
    </product>
    <product id="P1002">
        <name>Grainfields Multigrain Bread 400g</name>
        <price>1.89</price>
        <stock>75</stock>
    </product>
    <product id="P1003">
        <name>GoldenSpoon Corn Cereal 500g</name>
        <price>3.79</price>
        <stock>95</stock>
    </product>
    <product id="P1004">
        <name>Creamline Dairy Whitener 400g</name>
        <price>4.45</price>
        <stock>60</stock>
    </product>
    <product id="P1005">
        <name>PureSalt Crystal Salt 1kg</name>
        <price>0.99</price>
        <stock>210</stock>
    </product>
    <product id="P1006">
        <name>BakeJoy Butter Cookies 200g</name>
        <price>1.29</price>
        <stock>180</stock>
    </product>
    <product id="P1007">
        <name>CrunchMax Potato Chips Classic 52g</name>
        <price>0.79</price>
        <stock>300</stock>
    </product>
    <product id="P1008">
        <name>FieldHarvest Whole Wheat Flour 5kg</name>
        <price>6.75</price>
        <stock>50</stock>
    </product>
    <product id="P1009">
        <name>BeeBliss Natural Honey 250g</name>
        <price>3.89</price>
        <stock>90</stock>
    </product>
    <product id="P1010">
        <name>Noodlicious Instant Noodles Spicy 70g</name>
        <price>0.59</price>
        <stock>400</stock>
    </product>`;

isolated table<Customer> key (id) customers = table [
    {id: "C001", name: "Clara Zhang", email: "clara@sample.net", phone: "555-345-6789", loyalty: {points: 2800, expiryDate: "2026-08-31"}},
    {id: "C002", name: "Brian Holt", email: "brian@test.org", phone: "555-234-5678", loyalty: {points: 750, expiryDate: "2025-09-31"}},
    {id: "C003", name: "Tharik Kanaka", email: "o2mart.info@gmail.com", phone: "555-123-4567", loyalty: {points: 7500, expiryDate: "2025-07-31"}},
    {id: "C004", name: "David Miller", email: "david@demo.dev", phone: "555-456-7890", loyalty: {points: 350, expiryDate: "2025-10-20"}},
    {id: "C005", name: "Emma Wilson", email: "emma@test.org", phone: "555-567-8901", loyalty: {points: 920, expiryDate: "2025-12-15"}},
    {id: "C006", name: "Frank Johnson", email: "frank@example.com", phone: "555-678-9012", loyalty: {points: 2500, expiryDate: "2026-02-28"}},
    {id: "C007", name: "Grace Lee", email: "grace@sample.net", phone: "555-789-0123", loyalty: {points: 180, expiryDate: "2025-09-30"}}
];

isolated table<Order> key (id) orders = table [
    {
        id: "O1001",
        customerId: "C001",
        items: [
            {productId: "P1001", quantity: 2},
            {productId: "P1002", quantity: 1}
        ],
        total: 6.87,
        trackingId: "TRK-A7B3C"
    },
    {
        id: "O1002",
        customerId: "C002",
        items: [
            {productId: "P1003", quantity: 1},
            {productId: "P1007", quantity: 3}
        ],
        total: 6.16
    },
    {
        id: "O1003",
        customerId: "C003",
        items: [
            {productId: "P1004", quantity: 1},
            {productId: "P1005", quantity: 2}
        ],
        total: 6.43,
        trackingId: "TRK-X9Y2Z"
    },
    {
        id: "O1004",
        customerId: "C004",
        items: [
            {productId: "P1006", quantity: 2},
            {productId: "P1008", quantity: 1},
            {productId: "P1009", quantity: 1}
        ],
        total: 13.22
    },
    {
        id: "O1005",
        customerId: "C005",
        items: [
            {productId: "P1010", quantity: 5},
            {productId: "P1003", quantity: 1}
        ],
        total: 6.74,
        trackingId: "TRK-P5Q7R"
    },
    {
        id: "O1006",
        customerId: "C006",
        items: [
            {productId: "P1001", quantity: 1},
            {productId: "P1007", quantity: 2},
            {productId: "P1002", quantity: 3}
        ],
        total: 10.44,
        trackingId: "TRK-J2K4L"
    },
    {
        id: "O1007",
        customerId: "C007",
        items: [
            {productId: "P1010", quantity: 10},
            {productId: "P1009", quantity: 2}
        ],
        total: 13.68
    }
];
