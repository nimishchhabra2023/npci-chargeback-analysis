-- ================================================
-- File 3: Risk Outlier Analysis
-- Project: NPCI UPI Chargeback Analysis, March 2025
-- Author: Nimish Chhabra
-- ================================================

-- Identifies banks with high chargeback ratio regardless of transaction volume
-- Calculates acceptance rate to measure dispute management effectiveness
-- NULLIF prevents division by zero errors

SELECT
    Beneficiary_Bank,
    Total_Txns,
    CB_Ratio_Pct,
    CB_Received,
    CB_Accepted,
    ROUND(CAST(CB_Accepted AS FLOAT) / NULLIF(CB_Received, 0) * 100, 2) AS acceptance_rate_pct,
    CASE
        WHEN CB_Ratio_Pct >= 0.05 THEN 'Critical'
        WHEN CB_Ratio_Pct >= 0.01 THEN 'High Risk'
        WHEN CB_Ratio_Pct >= 0.005 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_flag
FROM npci_chargeback_march_2025
WHERE CB_Ratio_Pct > 0
ORDER BY CB_Ratio_Pct DESC
LIMIT 15;
