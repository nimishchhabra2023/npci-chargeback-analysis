-- ================================================
-- File 2: Volume Ranking & Risk Category
-- Project: NPCI UPI Chargeback Analysis, March 2025
-- Author: Nimish Chhabra
-- ================================================

-- Top 10 banks by UPI transaction volume with chargeback risk profile
-- Uses RANK() window function to assign volume rank
-- CASE statement categorises each bank by chargeback risk level

SELECT 
    RANK() OVER (ORDER BY Total_Txns DESC) AS volume_rank,
    Beneficiary_Bank,
    Total_Txns,
    CB_Received,
    CB_Ratio_Pct,
    CASE 
        WHEN CB_Ratio_Pct = 0 THEN 'Clean'
        WHEN CB_Ratio_Pct <= 0.001 THEN 'Low Risk'
        WHEN CB_Ratio_Pct <= 0.005 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_category
FROM npci_chargeback_march_2025
ORDER BY Total_Txns DESC
LIMIT 10;
