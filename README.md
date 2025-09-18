# Data-Driven Brand & Product Strategy

### HSLU R Bootcamp Project (September 2025)

## Abstract
R-based analysis of **YouTube Trending Videos** and **Google Trends** (2017–2018) for **iPhone**, **Tesla**, and **Rolex**. We demonstrate a concise workflow from data extraction and cleaning to visualization, modeling, and reporting in a Quarto Book (HTML & PDF), showcasing how platform data can inform brand and product strategy.

------------------------------------------------------------------------

## Project Idea

YouTube and Google are central platforms for global engagement. By analyzing their data, brands can better understand customer needs, design effective marketing strategies, and avoid misaligned campaigns.\
This project serves as both a **case study** and a **proof of concept** for how such insights can be provided to clients.

------------------------------------------------------------------------

## Data Analysis Process

### Data Description

-   **YouTube Trending Videos (Kaggle)**: Five countries (US, JP, MX, DE, FR), **2017-11-14 → 2018-06-14**, \~**183k** rows across **17** columns; after splitting multi-valued tags, \>**3.0M** rows. Key raw fields: title, channel, publish date, tags, views, likes/dislikes, description, comments.\
-   **Google Trends (`gtrendsR`)**: Relative search interest (**0–100**) for **iPhone**, **Tesla**, **Rolex** across the same five countries; variables include `date`, `hits`, `keyword`, `geo`.

### Data Preparation & Cleaning

-   **Merge & tag**: Combined country files, added country codes; split tags; filtered to keywords *(iPhone/Tesla/Rolex)*.\
-   **Engagement metrics**: Aggregated and derived ratios (e.g., likes/views, comments/views) for keyword-level insights.\
-   **Integration**: **Full join** of YouTube metrics with Google Trends by **date**, **keyword**, **country**; retained days with only search interest (YouTube metrics set to 0) and flagged YouTube-trending status.\
-   **Result**: Unified daily panel per keyword/country with views/likes/dislikes/comments, engagement ratios, video counts, and search interest.

------------------------------------------------------------------------

## Table of Contents

-   **Chapter 1: Our Story** – Background, project motivation, navigation tips\
-   **Chapter 2: Prepare the Data for Analysis** – Dataset overview, extraction, cleaning, transformation\
-   **Chapter 3: Analysis and Visualization** – Descriptive statistics, correlations, trend insights\
-   **Chapter 4: Chapter of Choice – The R Package gtrendsR** – Demonstration of Google Trends analysis with R\
-   **Chapter 5: Generative AI Usage and Guidelines** – Responsible use of AI to support research\
-   **Chapter 6: Conclusion, Limitations, and Outlook** – Key takeaways, challenges, future directions

------------------------------------------------------------------------

## How to Use

### Folder Structure

-   `_quarto.yml` – Quarto configuration\
-   `index.qmd` – Introduction and Chapter 1\
-   `style.css` – Custom styling\
-   `Chapters_Rbootcamp_Project/` – Remaining chapters as `.qmd` files\
-   `_book/` – Rendered outputs (created after build)

### Rendering

Run in the project root: quarto render

## Outputs

Outputs are written to `_book/` as **HTML** (`index.html`) and **PDF** (`Data_Driven_Brand_Product_Strategy_Gao_Huber.pdf`).

## Dependencies

Requires **R**, **RStudio**, and **Quarto**. Main R packages (grouped):

-   **Core analysis:** `tidyverse`, `lubridate`\
-   **Visualization:** `ggplot2`, `ggridges`, `scales`, `RColorBrewer`, `wordcloud2`, `gridExtra`\
-   **Mapping & geodata:** `sf`, `rnaturalearth`, `countrycode`\
-   **Google Trends:** `gtrendsR` *(note: rate/usage often limited after a few downloads)*\
-   **Utilities:** `here`, `grid`, `stopwords`\
-   **Rendering/output:** `ragg`, `systemfonts`, `textshaping`, `webshot2`, `htmlwidgets`, `rsvg`

------------------------------------------------------------------------

## Outputs

-   **HTML Book:** `_book/index.html`\
-   **PDF Report:** `_book/Data_Driven_Brand_Product_Strategy_Gao_Huber.pdf`

------------------------------------------------------------------------
**Outliers**

In case the second **wordcloud (iPhone) doesn't render correctly**
on your browser, please kindly reference to our PDF file.

We have found out that on in some environment, this graph couldn't render.
The reason is CORS (Cross-Origin Resource Sharing) policy violations (shown in browser console)
since it is opened the HTML file directly from local file system.

This is a technical challenge that we need to investigate further.
------------------------------------------------------------------------

## Outputs
## Authors & Contact

Created by Dongyuan Gao & Daniel Huber HSLU R Bootcamp 2025

**Contact:**

Email: gao.dongyuan2010\@gmail.com & dhub100\@gmail.com

GitHub: https://github.com/dydy2010

------------------------------------------------------------------------

## License

This project is licensed under the **MIT License**.\
See: [MIT License](https://opensource.org/licenses/MIT)
