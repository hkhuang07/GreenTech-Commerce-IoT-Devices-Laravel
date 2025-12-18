--Import Roles before register
INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Full access to manage the application, including user accounts, permissions, and configuration settings.', '2025-11-08 12:01:46', '2025-12-10 07:00:43'),
(2, 'Users', 'Regular user with access to standard features and resources of the system.', '2025-11-08 12:01:46', '2025-12-10 07:00:50'),
(3, 'Saler', 'Responsible for sales-related activities, such as managing product listings, processing orders, and handling customer inquiries.', '2025-11-08 12:01:46', '2025-11-08 12:01:46'),
(4, 'Shipper', 'Handles logistics and shipping tasks, including dispatching orders and tracking shipments.', '2025-11-08 12:01:46', '2025-11-08 12:01:46');
COMMIT;

