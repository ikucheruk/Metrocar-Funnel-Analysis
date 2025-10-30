# Metrocar-Funnel-Analysis
An analytical project aimed at studying the behavior of users of the MetroCar app, a car rental service.


## Overview
Metrocar is a ride-hailing platform similar to Uber or Bolt.  
This project analyzes the full user funnel — from app download to leaving a review — to identify where users drop off and what factors influence retention.

---

## Objectives
- Build a complete **user funnel** and calculate conversion rates at each step  
- Identify **drop-off points** and investigate potential reasons for user loss  
- Analyze **cancellation behavior** by time of day, day of week, and initiator (driver vs passenger)  
- Assess **platform efficiency** (iOS, Android, Web)  
- Examine **age group activity and revenue patterns**

---

## Tools & Technologies
- Database: PostgreSQL
- **SQL** for data extraction and aggregation
- **Excel / Google Sheets** for calculations
- **Tableau** for dashboards

---

## Key Insights
- Only **26.4%** of users who download the app complete a ride  
- **52%** of users drop off before requesting their first ride  
- **35%** of all requests are cancelled by users, mainly when waiting exceeds **10 minutes**  
- The **iOS platform** leads with 60% of total rides and users  
- **35–44 age group** is the most active and profitable  
- **35% of users** have unknown age — indicating missing demographic data

---

## Recommendations
- Reduce **waiting time** below 10 minutes to minimize cancellations  
- Improve **onboarding flow** after signup to motivate first ride  
- Focus marketing on **iOS users** and **35–44 age group**  
- Encourage users to fill in **age data** during registration  
- Implement **incentives** (discounts/bonuses) for delayed rides or feedback submission

---
## Files
- `metrocar_analysis.sql` – all SQL queries used for data extraction  
- `Metrocar_report_UA.pdf` – analytical report (in Ukrainian)
- - `Metrocar_Report_EN.pdf` – analytical report (in English)   
- [Google Sheets Calculations](https://docs.google.com/spreadsheets/d/1O8VghSd-DtZTFIJ-Vne_2BVOWs9O5q4nUwD8dC35vY0/edit?usp=sharing) – detailed metrics and pivot tables  
- [User funnel & waiting time](https://public.tableau.com/app/profile/iryna.kucheruk/viz/Userfunnel_17488058149410/FunnelWT) (
static Tableau dashboard)  
- [Users activity](https://public.tableau.com/views/UseractivityMetrocarProject/Usersactivity?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)– interactive data visualizations 



📊 Tableau Dashboards  
Here are screenshots of the Tableau dashboards.  
You can explore the interactive versions via the links above.

<img width="1752" height="1076" alt="image" src="https://github.com/user-attachments/assets/45b29536-df74-40c2-aa1c-3b3d8c3300d2" />  

<img width="1255" height="888" alt="image" src="https://github.com/user-attachments/assets/f148887f-7aea-4c90-bb5d-bb4ca4724b4c" />




