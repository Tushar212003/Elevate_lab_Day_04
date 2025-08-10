# 🚴 BikeStore Database

This repository contains the SQL schema and example queries for a fictional **Bike Store** database, designed for practicing SQL queries, database design, and relational concepts.

---

## 📌 Overview
The database models a bike store chain, including:

- **Brands** of bikes
- **Categories** of products
- **Customers**
- **Orders and Order Items**
- **Products**
- **Staff members**
- **Stores**
- **Stocks and Inventory**

It also includes:

- Example **JOIN** queries
- Example **aggregation** queries
- A **view** for product stock information
- **Indexes** for performance optimization

---

## 🗄 Database Schema

### Main Tables
| Table Name     | Description |
|----------------|-------------|
| **brands**     | Stores brand information |
| **categories** / **category** | Stores product category details |
| **customers**  | Stores customer details (contact info, address) |
| **products**   | Stores product details (name, brand, category, model year, price) |
| **orders**     | Stores order details including status and dates |
| **order_items**| Stores the products in each order |
| **staffs**     | Stores staff details |
| **stores**     | Stores store locations and contact details |
| **stocks**     | Stores inventory levels for each product in each store |

**Additional Features**
- **View:** `product_stock_view` — shows product name, category, and quantity.
- **Indexes:** `idx_category_id`, `idx_store_id` — for faster queries.

---


