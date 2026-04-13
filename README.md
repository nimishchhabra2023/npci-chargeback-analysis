# NPCI UPI Chargeback Analysis — March 2025

## Business Context

Chargebacks are a critical risk metric in the UPI payments ecosystem. When a customer disputes a transaction, the beneficiary bank is held accountable. High chargeback ratios signal poor merchant quality, fraud exposure, or weak dispute management — all of which attract regulatory scrutiny from NPCI and RBI.

This project analyses official NPCI chargeback data for March 2025 across 748 banks and payment institutions active on the UPI network.

---

## Data Source

**Source:** NPCI Official Chargeback Statistics, March 2025  
**Link:** https://www.npci.org.in/what-we-do/upi/upi-ecosystem-statistics  
**Records:** 748 banks and payment institutions  
**Fields:** Bank code, total UPI transactions, chargeback ratio, chargebacks received, re-presentments raised, chargebacks accepted

> Note: Dataset captures transaction count and chargeback frequency metrics. Dispute rupee value is not publicly disclosed by NPCI as it constitutes confidential bank-level information.

---

## Tools Used

- SQL (SQLite)
- DB Browser for SQLite

---

## SQL Concepts Demonstrated

- RANK() window function
- CASE statements for risk categorisation
- NULLIF for division by zero handling
- CAST for float division
- Derived metrics from raw fields
- WHERE filtering and ORDER BY

---

## Key Findings

**1. UPI ecosystem processed ~202 billion transactions in March 2025**  
748 banks participated as beneficiary institutions with an average chargeback ratio of 0.0081%.

**2. Top 10 banks by volume are largely well-managed**  
Among the top 10 banks by transaction volume, only ICICI Bank LTD GTI falls in the Medium Risk category (CB ratio 0.002%). All others are Clean or Low Risk — indicating that high-volume banks have mature dispute management processes.

**3. PAYPOINT INDIA NETWORK is the most concerning mid-size institution**  
With 630 chargebacks per million transactions and a 78% loss rate on contested disputes, PAYPOINT shows both high dispute frequency and poor resolution capability — a dual risk signal.

**4. Small banks show extreme CB ratios but low absolute volume**  
NPC recorded a 4.44% chargeback ratio — the highest in the ecosystem — but processed only 45 transactions. Statistical significance is low, but regulatory flags apply regardless of volume.

**5. Tamil Nadu Grama Bank and G P Parsik Sahakari Bank show best-in-class dispute management**  
Both contest 100% of chargebacks received and accept 0% — indicating strong internal dispute review processes.

---

## Project Structure

npci-chargeback-analysis/
│
├── README.md
├── data/
│   └── npci_chargeback_march_2025.csv
└── sql/
├── 01_exploration.sql
├── 02_volume_ranking.sql
├── 03_risk_analysis.sql
└── 04_cb_rate_normalisation.sql

---

*Analysis by Nimish Chhabra | Senior Business Analyst | EXL*
