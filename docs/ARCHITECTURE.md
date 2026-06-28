# Architecture FinanceHub

## Objectif

FinanceHub est une plateforme permettant de gérer les transactions financières, les comptes, les objectifs d'épargne, les documents générés et les analyses Power BI.

L'objectif architectural est de séparer clairement les responsabilités entre :

- l'interface utilisateur
- la logique métier
- le stockage opérationnel
- la transformation analytique
- la visualisation

---

## Architecture globale

```text
Utilisateur
    |
    v
Streamlit - Frontend
    |
    v
FastAPI - Backend métier
    |
    v
SQL Server - Base opérationnelle OLTP
    |
    v
dbt Core - Transformation analytique
    |
    v
Data Warehouse / Data Marts
    |
    v
Power BI - Reporting