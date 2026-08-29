# Power BI Dashboard

`orders_for_powerbi.csv` (this folder) and `../data/customer_segments.csv` are the two source
files loaded into the Power BI report. The `.pbix` file itself isn't checked into this repo
(binary files bloat git history) — add a link to it here once it's uploaded somewhere
accessible, e.g.:

- Published to Power BI Service: `[View live dashboard](your-published-link-here)`
- Or Google Drive / OneDrive link to the `.pbix` file for download

## Dashboard Pages

1. **Executive Overview** — Total Revenue, Total Profit, Total Orders, AOV, Customer Count,
   Profit Margin %, Repeat Customer %, and the monthly Revenue & Profit trend.
2. **Sales Analysis** — Revenue by Category and Sub-Category, Revenue & Profit by Region,
   Top 10 Products by Revenue.
3. **Customer Analysis** — RFM segment breakdown, average CLV by segment, Top 10 Customers,
   and a Recency-vs-Monetary scatter plot colored by segment.

## Recording a Dashboard GIF for the README

1. Open the `.pbix` in Power BI Desktop, with all slicers cleared.
2. Use a free screen recorder:
   - **Windows**: [ScreenToGif](https://www.screentogif.com/) (free, purpose-built for this)
   - **Mac**: QuickTime screen recording, then convert to GIF with [gifski](https://gif.ski/) or an online converter
   - **Any OS**: [ShareX](https://getsharex.com/) (Windows) or [Peek](https://github.com/phw/peek) (Linux)
3. Record ~10-15 seconds: click through the three page tabs, then click one slicer to show
   the interactivity.
4. Keep the file under ~5-8MB so it loads quickly in the GitHub README — trim resolution or
   frame rate in the recorder's export settings if needed.
5. Save it as `dashboard/dashboard_preview.gif` and reference it in the main README with:
   `![Dashboard Preview](dashboard/dashboard_preview.gif)`
