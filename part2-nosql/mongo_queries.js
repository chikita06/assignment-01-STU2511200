// OP1: insertMany() — insert all 3 documents

db.products.insertMany([
  {
    product_id: "E001",
    name: "Smartphone",
    category: "Electronics",
    price: 25000,
    brand: "Samsung",
    specs: {
      warranty: "1 year",
      voltage: "220V",
      storage: "128GB"
    },
    ratings: [4, 5, 5, 3]
  },
  {
    product_id: "C001",
    name: "T-Shirt",
    category: "Clothing",
    price: 799,
    brand: "Nike",
    sizes: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Red", "Black"]
  },
  {
    product_id: "G001",
    name: "Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: "2026-04-01",
    nutrition: {
      calories: 150,
      fat: "3.5g",
      protein: "8g"
    }
  }
]);

// OP2: find Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: add discount_percent field
db.products.updateOne(
  { product_id: "E001" },
  { $set: { discount_percent: 10 } }
);

// OP5: create index on category
db.products.createIndex({ category: 1 });

// Index improves query performance when filtering by category,
// making search operations faster especially on large datasets