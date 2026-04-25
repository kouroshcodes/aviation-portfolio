# ✈️ Aviation Passenger Satisfaction Analysis

A data analytics portfolio project analyzing airline passenger satisfaction 
across 103,904 passengers — built to demonstrate SQL analysis, data 
storytelling, and visualization skills in an aviation context.

---

## 📊 Dashboard Preview

![Dashboard Preview](01_passenger_satisfaction/assets/dashboard_preview.png)
🔗 [View Interactive Dashboard on Tableau Public](https://public.tableau.com/app/profile/mohamamd.gerashi/viz/AviationPassengerSatisfactionAnalysis/Dashboard1)
---

## 🔍 Key Findings

- **56.7%** of passengers are dissatisfied — the majority leave unhappy
- **Business class** achieves 69.4% satisfaction vs only **18.6% in Economy**
- **Personal travelers** have a catastrophic **10.2%** satisfaction rate
- **Inflight WiFi** is the lowest-rated touchpoint across every passenger segment
- **Online Boarding** has the biggest gap between satisfied and dissatisfied passengers (+1.37)
- Delays under 15 minutes have almost **no impact** on satisfaction — the product experience is the problem, not punctuality

---

## 🗂️ Project Structure

The project is organized under `01_passenger_satisfaction/` containing:
- `data/` — raw dataset and exported query results
- `project_sql/` — all 12 SQL analysis files
- `assets/` — dashboard preview image
---

## 📁 SQL Analysis Files

| File | Question Answered |
|------|------------------|
| q01_overall_satisfaction_rate.sql | What is the overall satisfaction rate? |
| q02_satisfaction_by_class.sql | How does satisfaction differ by cabin class? |
| q03_satisfaction_by_loyalty.sql | Does customer loyalty correlate with satisfaction? |
| q04_satisfaction_by_travel_type.sql | Business vs personal traveler satisfaction |
| q05_satisfaction_by_age_group.sql | Which age groups are most/least satisfied? |
| q06_satisfaction_by_gender.sql | Does gender influence satisfaction? |
| q07_avg_rating_by_touchpoint.sql | Average rating across 14 service touchpoints |
| q08_satisfaction_gap_by_touchpoint.sql | Which touchpoints drive satisfaction most? |
| q09_business_class_touchpoint_ratings.sql | Lowest-rated touchpoints for Business class |
| q10_satisfaction_by_delay.sql | Do delays cause dissatisfaction? |
| q11_delay_impact_by_class.sql | Does delay impact Business vs Economy differently? |
| q12_executive_summary.sql | Full executive summary using CTEs |

---

## 🛠️ Tools Used

- **PostgreSQL** — all data analysis and querying
- **VSCode + SQLTools** — development environment
- **Tableau** — dashboard and visualization
- **Dataset** — [Airline Passenger Satisfaction — Kaggle](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction)
- **Claude (Anthropic)** — AI pair programming partner for SQL guidance, 
analysis interpretation, and portfolio structure
---

## 👤 About

Built by a commercial pilot transitioning into data analytics, combining 
domain expertise in aviation operations with data analysis skills.
Currently building toward a career in aviation data and product analytics.