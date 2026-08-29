# E-Commerce Sales & Customer Analytics — Business Insights & Recommendations

**Dataset:** Sample Superstore | 9,994 order line items | 5,009 orders | 793 customers | 2014–2017
**Total Revenue:** $2,297,200.86 &nbsp;|&nbsp; **Total Profit:** $286,397.02 (12.5% margin) &nbsp;|&nbsp; **AOV:** $458.61 &nbsp;|&nbsp; **Repeat Customer Rate:** 98.5%

This document summarizes the key findings from the SQL, Python EDA, and customer segmentation
phases of the project, and translates each one into a concrete, data-backed recommendation.

---

## 1. Furniture is the company's biggest margin problem

| Category | Revenue | Profit | Margin |
|---|---|---|---|
| Technology | $836,154 | $145,455 | **17.4%** |
| Office Supplies | $719,047 | $122,491 | **17.0%** |
| Furniture | $741,999 | $18,451 | **2.5%** |

Furniture generates almost as much revenue as Technology, but converts it into 8x less profit.
The problem is concentrated in two sub-categories:

- **Tables**: -8.6% margin (-$17,725 loss on $206,966 revenue)
- **Bookcases**: -3.0% margin (-$3,473 loss on $114,880 revenue)

**Recommendation:** Audit the discount policy specifically for Tables and Bookcases — cross-referencing
with the discount analysis below (Section 3), it's likely these two sub-categories are being
discounted more heavily than the rest of the catalog. Consider a minimum-margin floor on quotes
for these items, or renegotiate supplier/COGS terms before continuing to promote them at current
discount levels.

## 2. A handful of sub-categories drive disproportionate profit

| Sub-Category | Revenue | Margin |
|---|---|---|
| Labels | $12,486 | **44.4%** |
| Paper | $78,479 | **43.4%** |
| Envelopes | $16,476 | **42.3%** |
| Copiers | $149,528 | **37.2%** |

These are small-ticket, high-margin items. They're unlikely to be the centerpiece of a marketing
push on their own, but they're strong candidates for **cross-sell add-ons** at checkout — pairing
them with larger Technology purchases (Copiers already sit in the same category) captures margin
that a Furniture-heavy promotion would erode.

**Recommendation:** Feature Paper, Labels, and Envelopes as "frequently needed with" suggestions
on Office Supplies and Technology product pages.

## 3. Discounts above ~21% reliably turn orders unprofitable

| Discount Band | Revenue | Profit | Margin |
|---|---|---|---|
| 0% | $1,087,908 | $320,988 | **29.5%** |
| 1–10% | $54,369 | $9,029 | 16.6% |
| 11–20% | $792,153 | $91,756 | 11.6% |
| 21–30% | $103,227 | **-$10,369** | **-10.1%** |
| 31–50% | $195,315 | **-$48,448** | **-24.8%** |
| 50%+ | $64,229 | **-$76,559** | **-119.2%** |

This is the sharpest, most actionable pattern in the dataset. Every discount band above 20%
loses money — and the loss accelerates fast. Orders discounted 50%+ lose more than the full sale
value on average.

**Recommendation:** Cap standard discount approval at 20% without manager sign-off. This single
policy change, if applied retroactively, would have protected roughly $135K in profit that was
lost to discounts above 20% in this dataset alone (sum of the three negative-margin bands).

## 4. Regional performance: Central lags on margin, not volume

| Region | Revenue | Margin | Orders |
|---|---|---|---|
| West | $725,458 | **14.9%** | 1,611 |
| East | $678,781 | 13.5% | 1,401 |
| Central | $501,240 | **7.9%** | 1,175 |
| South | $391,722 | 11.9% | 822 |

Central isn't underperforming on order volume (1,175 orders is respectable) — its problem is
margin, sitting nearly 7 points below West. This points toward a regional discounting or
product-mix issue rather than a demand problem.

**Recommendation:** Break down Central's sub-category mix and discount rates specifically —
if Central is simply selling more Furniture/Tables proportionally, that alone would explain the
gap and ties directly back to Section 1.

## 5. Clear seasonal peak in November–December

Revenue spikes every single year in November and December, with a secondary smaller bump in
September (see `charts/06_seasonality.png` and the monthly trend chart). This is consistent
across all four years in the dataset, not a one-time anomaly.

**Recommendation:** Weight inventory planning, staffing, and marketing spend toward Q4,
specifically the Nov–Dec window. Consider whether a mid-year promotion (June/July, currently the
flattest months) could smooth demand rather than concentrating it further.

## 6. Customer base is loyal — but value is concentrated in a small group

Repeat customer rate is **98.5%**, which is unusually high — nearly every customer in this
dataset has ordered more than once. RFM segmentation breaks the 793 customers down as:

| Segment | Customers | Avg. Customer Value | Total Revenue |
|---|---|---|---|
| Champions | 106 (13%) | $5,288 | $560,499 |
| Loyal Customers | 225 (28%) | $2,900 | $652,576 |
| At Risk | 145 (18%) | $3,411 | $494,541 |
| Needs Attention | 111 (14%) | $3,034 | $336,802 |
| New Customers | 89 (11%) | $1,796 | $159,851 |
| Lost | 117 (15%) | $794 | $92,932 |

**The 13% of customers classified as Champions generate roughly 24% of total revenue.**
The **At Risk group (145 customers, $494K in historical revenue)** is the single highest-leverage
retention opportunity — these are proven high-value customers who have gone quiet, not
low-value customers who were never engaged.

**Recommendation:**
- Build a targeted win-back campaign for the At Risk segment (145 customers) — even a modest
  reactivation rate here recovers meaningfully more revenue than acquiring new customers at
  the New Customer segment's average value ($1,796).
- Offer Champions early access/loyalty perks — losing even a handful of this group has an
  outsized revenue impact given their $5,288 average value.

## 7. Products frequently bought together support bundling opportunities

Market basket analysis (Apriori, sub-category level) surfaced association pairs with lift > 1,
meaning these sub-categories are bought together more often than random chance would predict —
see `customer_segmentation.ipynb` / `ecommerce_eda.ipynb` for the full, ranked rule list.

**Recommendation:** Use the highest-lift pairs to inform "customers also bought" placement and
bundle promotions, prioritizing pairs that combine a low-margin item with a high-margin one
(e.g., pairing Furniture purchases with high-margin Office Supplies) to lift overall order margin.

---

## Summary of Recommendations (Priority Order)

1. **Cap discounts at 20%** without manager approval — the single clearest, most defensible
   policy change in this analysis (est. $135K in protected profit).
2. **Review Tables and Bookcases pricing/discounting** — the primary driver of Furniture's
   2.5% margin.
3. **Launch a targeted retention campaign for the 145 At-Risk customers** — proven high value,
   currently going quiet.
4. **Investigate Central region's discount/product mix** to close the margin gap with West/East.
5. **Shift inventory and marketing spend toward Q4** to match the confirmed Nov–Dec demand spike.
6. **Use high-margin, frequently-paired items** (Paper, Labels, Copiers) as cross-sell anchors
   at checkout.

---

*Methodology note: all figures in this document are pulled directly from the SQL queries
(Phase 2) and Python EDA / segmentation notebooks (Phases 3–4) of this project, not estimated
or rounded from chart visuals — see the `sql/` and notebook files for the exact queries behind
each number.*
