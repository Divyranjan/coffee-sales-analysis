# ☕ Coffee Sales Analytics & Market Expansion Strategy

### 🚀 End-to-End SQL-Driven Business Intelligence Project

---

## 🧭 Executive Summary

This project presents a **holistic, data-centric analysis** of a multi-city coffee retail business, transforming raw transactional data into **strategic insights and actionable intelligence** using SQL.

The analysis is designed to answer critical business questions around:

* 📍 **Where to expand next?**
* 💰 **Which cities generate maximum revenue vs cost?**
* 👥 **Where are high-value customers concentrated?**
* ☕ **Which products drive demand regionally?**
* 📈 **Is the business growing sustainably over time?**

By leveraging **advanced SQL querying, KPI engineering, and analytical reasoning**, this project simulates a real-world **data analyst / business intelligence workflow**.

---

## 🎯 Problem Statement

The company operates across multiple cities but lacks clarity on:

* Market size and penetration
* Customer purchasing behavior
* Product demand distribution
* Revenue efficiency across locations
* Growth trends over time

👉 Without these insights, **expansion decisions become speculative rather than data-driven**.

---

## 🧱 Data Model & Schema Design

The project follows a **star-schema-inspired relational structure**:

### 🏙️ Dimension Tables

#### `city`

* Defines geographic and economic context
* Includes population and rental cost (key for cost analysis)

#### `customers`

* Represents individual users
* Linked to city → enables segmentation

#### `products`

* Defines product catalog
* Enables product-level performance analysis

---

### 💰 Fact Table

#### `sales`

* Core transactional dataset
* Captures:

  * Purchase behavior
  * Revenue generation
  * Product consumption

👉 This design supports **multi-dimensional analysis across time, geography, and products**

---

## 🧠 Analytical Methodology

The project follows a **structured analytics pipeline**:

```text
Data Joining → Aggregation → KPI Calculation → Segmentation → Ranking → Insight Extraction
```

---

## 🧪 SQL Techniques & Concepts Applied

### 🔹 Core SQL

* SELECT, WHERE, GROUP BY, ORDER BY
* INNER JOIN, LEFT JOIN

### 🔹 Aggregation Layer

* `SUM()` → Revenue
* `COUNT()` → Transactions
* `COUNT(DISTINCT)` → Unique customers

### 🔹 Derived Metrics (KPI Engineering)

* ARPC → Average Revenue Per Customer
* Rent per Customer
* Market Penetration Ratio
* Growth Rate

### 🔹 Time-Series Analysis

* `DATE_FORMAT()`
* `YEAR()`, `QUARTER()`

### 🔹 Advanced SQL (Window Functions)

* `DENSE_RANK()` → Top-N analysis
* `LAG()` → Growth comparison

---

## 📊 Analytical Breakdown & Insights

---

### 🔹 1. Market Size Estimation

📌 **Goal:** Estimate potential coffee consumers

💡 **Method:**
Assume 25% population consumes coffee

📈 **Insight:**

* Cities with large populations = high TAM (Total Addressable Market)
* Reveals **expansion-ready markets**

---

### 🔹 2. Revenue Analysis (Temporal)

📌 **Goal:** Evaluate recent performance (Q4 2023)

📈 **Insight:**

* Identifies cities driving recent revenue
* Helps detect **momentum vs stagnation**

---

### 🔹 3. Product Demand Intelligence

📌 **Goal:** Identify top-selling products

📈 **Insight:**

* Demand varies by city
* Enables **localized product strategy**

---

### 🔹 4. Customer Value (ARPC)

📌 **Goal:** Measure how much each customer contributes

📈 **Insight:**

* High ARPC cities → premium markets
* Low ARPC → price-sensitive markets

---

### 🔹 5. Revenue vs Customer Base

📌 **Goal:** Understand scale vs efficiency

📈 **Insight:**

* High customers + low revenue → low monetization
* Low customers + high revenue → premium targeting

---

### 🔹 6. Market Penetration Gap

📌 **Goal:** Compare potential vs actual customers

📈 **Insight:**

* Large gap → untapped opportunity
* Small gap → saturated market

---

### 🔹 7. Product Segmentation (Top-N Analysis)

📌 **Goal:** Identify top 3 products per city

📈 **Insight:**

* Regional preferences emerge
* Drives **inventory & marketing decisions**

---

### 🔹 8. Active Customer Base

📌 **Goal:** Identify engaged users

📈 **Insight:**

* Measures **actual demand**
* Helps track customer reach

---

### 🔹 9. Growth Trend Analysis

📌 **Goal:** Measure month-over-month growth

📈 **Insight:**

* Positive growth → expansion signal
* Negative growth → risk indicator

---

### 🔹 10. City-Level Performance Modeling

📌 **Goal:** Combine all KPIs

📊 **Metrics:**

* Revenue
* Customers
* ARPC
* Rent per customer
* Market size

📈 **Insight:**

* Enables **holistic city evaluation**

---

## 🏆 Strategic Recommendations (Data-Driven)

---

### 🥇 Pune — **High-Performance Growth Hub**

* 🔥 Highest revenue
* 💰 Strong ARPC
* 🏠 Controlled rent
* 📊 Balanced customer base

👉 **Best city for aggressive expansion**

---

### 🥈 Chennai — **Stable & Predictable Market**

* 💵 Consistent revenue
* ⚖ Balanced cost structure
* 📊 Reliable customer engagement

👉 **Ideal for steady, low-risk growth**

---

### 🥉 Jaipur — **Cost-Efficient High Volume Market**

* 👥 Largest customer base
* 💸 Lowest rent per customer
* 📈 Strong efficiency metrics

👉 **Perfect for scaling with optimized cost**

---

## ⚠️ Strategic Risks & Observations

---

### ❌ Bangalore — High Cost, Low Efficiency

* Elevated rent burden
* High cost per acquisition
* Margin compression risk

---

### ❌ Delhi — High Potential, Low Monetization

* Large market size
* Lower ARPC
* High rent

👉 Requires **pricing & engagement optimization**

---

## 📈 Business Value Delivered

This project enables:

* 🎯 Precision-driven expansion planning
* 💰 Profitability optimization
* 📊 KPI-based performance tracking
* 📦 Demand forecasting
* 👥 Customer segmentation

---

## 🧩 Project Structure

```text
coffee-sales-analysis/
│
├── queries.sql
├── dataset/
├── README.md
```

---

## 💼 Resume-Ready Statement

> Developed a comprehensive SQL-based analytics framework to evaluate multi-city coffee sales performance, leveraging advanced joins, aggregations, and window functions to generate actionable business insights and guide strategic expansion decisions.

---

## 🔥 Final Insight

This project demonstrates:

✔ Strong SQL proficiency
✔ Business thinking & analytical mindset
✔ Ability to translate data into decisions
✔ End-to-end problem-solving capability

---

## 🙌 Author

**Divyranjan Routray**

* 💼 Aspiring Data Analyst / Software Developer
* 🔗 GitHub: https://github.com/Divyranjan
* 🔗 LinkedIn: https://www.linkedin.com/in/divyranjanroutray

---

⭐ If this project impressed you, give it a star and connect! 🚀
