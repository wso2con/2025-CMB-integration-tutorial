// Sample in-memory data
isolated table<Customer> key (id) customers = table [
    {id: "C001", name: "Alice Fern", email: "alice@example.com", phone: "555-123-4567"},
    {id: "C002", name: "Brian Holt", email: "brian@test.org", phone: "555-234-5678"},
    {id: "C003", name: "Clara Zhang", email: "clara@sample.net", phone: "555-345-6789"},
    {id: "C004", name: "David Miller", email: "david@demo.dev", phone: "555-456-7890"},
    {id: "C005", name: "Emma Wilson", email: "emma@test.org", phone: "555-567-8901"},
    {id: "C006", name: "Frank Johnson", email: "frank@example.com", phone: "555-678-9012"},
    {id: "C007", name: "Grace Lee", email: "grace@sample.net", phone: "555-789-0123"}
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
