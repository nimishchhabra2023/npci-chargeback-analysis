-- ================================================
-- File 4: Chargeback Rate Normalisation
-- Project: NPCI UPI Chargeback Analysis, March 2025
-- Author: Nimish Chhabra
-- ================================================

-- Normalises chargeback volume per million transactions
-- Allows fair comparison between large and small banks
-- Contest rate shows how aggressively banks fight disputes
-- Loss rate shows what percentage of disputes banks ultimately lose

SELECT
    Beneficiary_Bank,
    Total_Txns,
    CB_Received,
    ROUND(CAST(CB_Received AS FLOAT) / Total_Txns * 1000000, 2) AS cb_per_million_txns,
    ROUND(CAST(Representment_Raised AS FLOAT) / NULLIF(CB_Received, 0) * 100, 2) AS contest_rate_pct,
    ROUND(CAST(CB_Accepted AS FLOAT) / NULLIF(CB_Received, 0) * 100, 2) AS loss_rate_pct
FROM npci_chargeback_march_2025
WHERE CB_Received > 100
ORDER BY cb_per_million_txns DESC
LIMIT 15;
