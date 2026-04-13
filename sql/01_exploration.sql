
-- ================================================
-- File 1: Data Exploration
-- Project: NPCI UPI Chargeback Analysis, March 2025
-- Author: Nimish Chhabra
-- ================================================

-- Overall ecosystem summary
SELECT 
    COUNT(*) AS total_banks,
    SUM(Total_Txns) AS total_transactions,
    SUM(CB_Received) AS total_chargebacks,
    ROUND(AVG(CB_Ratio_Pct), 4) AS avg_cb_ratio
FROM npci_chargeback_march_2025;
