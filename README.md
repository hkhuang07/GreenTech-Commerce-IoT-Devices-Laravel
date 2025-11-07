# 🌿 GreenTech-Commerce: Intelligent Agri, Fueling Markets

This is an integrated final project built on **PHP Laravel** (v11/10) that merges a specialized **IoT E-commerce platform** with a **Real-Time Data Visualization and Analytics Dashboard**.

The project fulfills requirements for both **PHP Web Technology** and **IoT Programming** by establishing a continuous data pipeline from sensor to web.

---

## 💻 I. Laravel Platform Core (E-commerce & Admin)

The core application manages all transactional and static data.

### 1. Database Architecture (MySQL)

We utilize a **normalized MySQL database** to ensure transaction integrity and a structured data layer for the E-commerce components.

| Component Group | Key Tables | Purpose |
| :--- | :--- | :--- |
| **User Management** | `users`, `roles` | Manages customer and administrator access, leveraging a dedicated `roles` table for easy scaling and permission handling. |
| **E-commerce Core** | `products`, `categories`, `manufacturers` | Handles product inventory, metadata (`slug`, `price`, `stock_quantity`), and product segmentation. |
| **Transactions** | `orders`, `order_items`, `order_statuses` | Stores historical sales data, tracking price at the time of order (`price_at_order`) and shipping details. |
| **Product Metadata** | `product_details`, `product_images` | Separated tables (1:1 and 1:Many) for technical specifications (`cpu`, `memory`) and image gallery management. |

### 2. Laravel Features & Routes (CRUD)

The administration panel (`app.blade.php` navigation) provides full **CRUD** functionality across all essential models, ensuring easy inventory and user management.

| Module | Primary Model | Purpose (Routes) |
| :--- | :--- | :--- |
| **E-commerce** | `Product`, `Order`, `Category` | Management of sales, stock, item details, and status updates. |
| **Core Admin** | `User`, `Role` | Management of user roles, permissions, and account activation (`is_active`). |
| **IoT Management** | `IoTDevice`, `DeviceMetric`, `AlertThresholds` | Manages the configuration, mapping, and alert rules required for the analytical dashboard. |

---

## 📊 II. Advanced Integration: IoT Data Visualization

The application's advanced feature is the ability to display and analyze sensor data from live Smart Garden deployments.

### 1. Dual-Database Connectivity

The system seamlessly combines MySQL data with NoSQL data:

* **IoT Control Tables (MySQL):** `iot_devices`, `device_metrics`, and `alert_thresholds` store the **metadata** required for fetching data (e.g., the `device_id` and the `metric_key` like 't' for temperature).
* **Time-Series Data (MongoDB Atlas):** Raw, high-volume sensor readings (`sensor_readings` collection) are persisted here via the Node.js Broker.
* **Technology:** PHP uses the dedicated **MongoDB PHP Driver** (required installation) to establish a direct connection to Atlas for real-time aggregation and plotting.

### 2. Data Visualization Logic

The dedicated **`DataVisualizationController`** performs the following operations:

1.  Retrieves the required **`device_id`** and **`metric_key`** (e.g., 'm' for moisture) from the MySQL configuration tables.
2.  Executes optimized **MongoDB queries** (time-based `$gte`) to retrieve historical sensor values.
3.  Formats the MongoDB output into **JSON** arrays (labels, datasets).
4.  Presents the data using a JavaScript charting library (e.g., **Chart.js** or **Plotly.js**) on the admin dashboard.

---

## ⚙️ III. Deployment and Backend Stack

| Component | Technology | Role in Integration |
| :--- | :--- | :--- |
| **Backend/Broker** | **Node.js (Aedes MQTT)** | Receives data from Wokwi/ESP32 devices and persists it to MongoDB. |
| **Network Link** | **Cloudflare Tunnel / Ngrok** | Provides the public TCP/MQTT endpoint (`mqtt-broker.hkhuang07.me`) necessary to bridge the cloud-based Wokwi simulator to the local Node.js Broker. |
| **Frontend/UI** | **Bootstrap 5 & Font Awesome** | Provides a responsive, clean interface for both E-commerce and the integrated data dashboard. |