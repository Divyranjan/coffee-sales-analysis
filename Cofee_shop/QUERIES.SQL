# ☕ Coffee Shop Sales Analysis – SQL Case Study (With Queries)

---

## 🔹 Query 1: Estimated Coffee Consumers per City

### ❓ Question

How many people in each city are estimated to consume coffee (25% of population)?

### 💡 Query

```sql
SELECT
    city_name,
    population,
    ROUND(0.25 * population, 0) AS estimated_coffee_consumers
FROM city
ORDER BY estimated_coffee_consumers DESC;
```

### 📊 Business Importance

* Helps estimate **market size**

### 🚀 Business Impact

* Identifies high-potential cities

---

## 🔹 Query 2: Total Revenue (Q4 2023)

### ❓ Question

What is the total revenue generated from coffee sales across all cities in Q4 2023?

### 💡 Query

```sql
SELECT
    c.city_name,
    SUM(s.total) AS total_revenue
FROM city c
JOIN customers cs ON c.city_id = cs.city_id
JOIN sales s ON s.customer_id = cs.customer_id
WHERE QUARTER(s.sale_date) = 4
  AND YEAR(s.sale_date) = 2023
GROUP BY c.city_name;
```

### 📊 Business Importance

* Measures recent performance

### 🚀 Business Impact

* Supports short-term decisions

---

## 🔹 Query 3: Units Sold per Product

### ❓ Question

How many units of each coffee product have been sold?

### 💡 Query

```sql
SELECT
    p.product_name,
    COUNT(*) AS units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC;
```

### 📊 Business Importance

* Identifies demand

### 🚀 Business Impact

* Helps inventory planning

---

## 🔹 Query 4: Average Sales per Customer per City

### ❓ Question

What is the average sales amount per customer in each city?

### 💡 Query

```sql
SELECT
    c.city_name,
    SUM(s.total) / COUNT(DISTINCT s.customer_id) AS avg_sales_per_customer
FROM city c
JOIN customers cs ON c.city_id = cs.city_id
JOIN sales s ON s.customer_id = cs.customer_id
GROUP BY c.city_name;
```

### 📊 Business Importance

* Measures customer value (ARPC)

### 🚀 Business Impact

* Helps pricing & targeting

---

## 🔹 Query 5: Revenue, Customers & Avg per Customer

### ❓ Question

Find revenue, total customers, and average revenue per customer per city.

### 💡 Query

```sql
SELECT
    c.city_name,
    SUM(s.total) AS revenue,
    COUNT(DISTINCT s.customer_id) AS total_customers,
    SUM(s.total) / COUNT(DISTINCT s.customer_id) AS avg_per_customer
FROM sales s
JOIN customers cs ON s.customer_id = cs.customer_id
JOIN city c ON cs.city_id = c.city_id
GROUP BY c.city_name
ORDER BY avg_per_customer DESC;
```

### 📊 Business Importance

* Combines volume + value

### 🚀 Business Impact

* Better comparison across cities

---

## 🔹 Query 6: Market Potential vs Actual Customers

### ❓ Question

List cities with population, estimated consumers, and actual customers.

### 💡 Query

```sql
SELECT
    c.city_name,
    c.population,
    ROUND(0.25 * c.population, 0) AS estimated_coffee_consumers,
    COUNT(DISTINCT cs.customer_id) AS unique_customers
FROM city c
LEFT JOIN customers cs ON c.city_id = cs.city_id
GROUP BY c.city_name, c.population
ORDER BY estimated_coffee_consumers DESC;
```

### 📊 Business Importance

* Compares potential vs actual

### 🚀 Business Impact

* Identifies untapped markets

---

## 🔹 Query 7: Top 3 Products per City

### ❓ Question

What are the top 3 selling products in each city based on sales volume?

### 💡 Query

```sql
SELECT city_name, product_name, sales_vol
FROM (
    SELECT
        c.city_name,
        p.product_name,
        COUNT(*) AS sales_vol,
        DENSE_RANK() OVER (
            PARTITION BY c.city_name
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM sales s
    JOIN customers cs ON s.customer_id = cs.customer_id
    JOIN products p ON s.product_id = p.product_id
    JOIN city c ON cs.city_id = c.city_id
    GROUP BY c.city_name, p.product_name
) t
WHERE rn <= 3;
```

### 📊 Business Importance

* Identifies top products

### 🚀 Business Impact

* Helps localized strategy

---

## 🔹 Query 8: Unique Coffee Customers per City

### ❓ Question

How many unique customers purchased coffee products in each city?

### 💡 Query

```sql
SELECT
    c.city_name,
    COUNT(DISTINCT s.customer_id) AS unique_customers
FROM sales s
JOIN customers cs ON s.customer_id = cs.customer_id
JOIN city c ON cs.city_id = c.city_id
JOIN products p ON s.product_id = p.product_id
WHERE p.product_name LIKE '%coffee%'
GROUP BY c.city_name
ORDER BY unique_customers DESC;
```

### 📊 Business Importance

* Measures active users

### 🚀 Business Impact

* Improves targeting

---

## 🔹 Query 9: Monthly Sales Growth Rate

### ❓ Question

What is the month-over-month sales growth percentage?

### 💡 Query

```sql
SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month) AS previous_month_revenue,
    (
        (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month))
        / LAG(monthly_revenue) OVER (ORDER BY month)
    ) * 100 AS growth_percentage
FROM (
    SELECT
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(total) AS monthly_revenue
    FROM sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
) t;
```

### 📊 Business Importance

* Tracks growth

### 🚀 Business Impact

* Helps forecasting

---

## 🔹 Query 10: Top 3 Cities by Performance

### ❓ Question

Identify top 3 cities based on highest sales along with key metrics.

### 💡 Query

```sql
SELECT *
FROM (
    SELECT
        c.city_name,
        SUM(s.total) AS total_sales,
        c.estimated_rent AS total_rent,
        COUNT(DISTINCT cs.customer_id) AS total_customers,
        ROUND(0.25 * c.population, 0) AS estimated_coffee_consumers,
        SUM(s.total) / COUNT(DISTINCT cs.customer_id) AS avg_per_customer,
        c.estimated_rent / COUNT(DISTINCT cs.customer_id) AS avg_rent_per_customer,
        DENSE_RANK() OVER (ORDER BY SUM(s.total) DESC) AS rn
    FROM city c
    JOIN customers cs ON c.city_id = cs.city_id
    JOIN sales s ON s.customer_id = cs.customer_id
    GROUP BY c.city_name, c.population, c.estimated_rent
) t
WHERE rn <= 3;
```

### 📊 Business Importance

* Complete performance view

### 🚀 Business Impact

* Supports expansion decisions

---

# 🏆 Final Recommendation

## 🌆 City 1: Pune

* 🔥 Highest revenue
* 💰 Strong average spend per customer
* 🏠 Moderate rent
* 📊 Good customer base

👉 **Best overall city for expansion**

---

## 🌆 City 2: Chennai

* 💵 Second highest revenue
* 📊 Good customer base
* 🏠 Rent manageable
* ⚖ Balanced earning vs cost

👉 **Stable and low-risk investment city**

---

## 🌆 City 3: Jaipur

* 👥 Highest customer count
* 💸 Lowest rent per customer
* 📈 Strong revenue compared to cost
* ⚖ Very efficient unit economics

👉 **High efficiency + growth potential city**

---

## ❌ Why Not Bangalore?

* 🏠 Rent is too high
* 💸 Avg rent per customer is highest
* ⚠️ Profit margin risk

---

## ❌ Why Not Delhi?

* 🌍 Huge market size
* 💰 Revenue per customer is lower
* 🏠 Rent is relatively high

👉 **High potential but currently inefficient market**

---

# 🎯 Final Conclusion

👉 Focus expansion on:

* Pune (High revenue leader)
* Chennai (Balanced growth)
* Jaipur (Efficient & scalable)

👉 Avoid high-cost / low-efficiency markets like Bangalore and Delhi for now.

---

🔥 **This completes a full end-to-end business analysis using SQL 💼🚀**
