# Fruit Prices Analysis - Data Science Project - 2023

## Academic Context
This project was developed as part of the "Intro to Data Science" course (2023).

## Project Overview

This project analyzes fruit pricing data from 2020, examining various fruits across different forms (fresh, canned, dried, frozen, juice) to understand pricing patterns, yields, and market distribution. The analysis employs both supervised and unsupervised machine learning techniques alongside interactive visualizations.

## Dataset Description

The dataset contains information on 62 different fruit entries with the following attributes:

- Fruit name and form (fresh, canned, dried, frozen, juice)
- Retail price and pricing unit
- Yield (proportion of usable fruit)
- Cup equivalent size and unit
- Cup equivalent price

## Team Members

| Name | ID | Role |
|------|-----|------|
| Ahmed Taha Mohamed Mohamed | 22010315 | Report |
| Moaz Moustafa Abdelhamid Moustafa | 22010273 | GUI |
| Ibrahim Gamil Abdelrahman Ahmed | 22010009 | GUI |
| Yasser Ashraf Mohamed Gaber | 22010409 | Data Cleaning, K-means, Decision Tree |
| Hamza Hussein Yousef Omran | 22011501 | Visualization |
| Karim Mohamed Samy Abo Shady | 22010378 | Report |

## Installation and Setup

### Required Packages

```r
install.packages("readxl")
install.packages("dplyr")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("shiny")
```

### Running the Project

1. Update the file path in the code to match your data location
2. Load all required libraries
3. Run the main script: `project.R`
4. For the Shiny application, execute the UI/Server code section

## Methodology

### Data Cleaning

- Checked for duplicate rows (Result: No duplicates found)
- Verified NA values (Result: No missing values)
- Used distinct() function to ensure data integrity

### Machine Learning Techniques

#### Unsupervised Learning: K-Means Clustering

Applied K-means clustering on RetailPrice and CupEquivalentPrice columns with 2 centers to identify fair-priced versus expensive fruits.

Results:
- Cluster 1: 13 fruits with higher prices (avg retail: 5.97, avg cup: 1.38)
- Cluster 2: 49 fruits with lower prices (avg retail: 1.73, avg cup: 0.80)
- Between SS / Total SS: 68.5%

#### Supervised Learning: Decision Tree

Built a decision tree using Form as the target variable with predictors: Fruit, Yield, and RetailPriceUnit.

Key findings:
- Canned fruits showed highest yield patterns
- Decision rules created based on fruit type and yield thresholds

### Visualizations

The project includes seven interactive visualizations via Shiny:

1. Boxplot - Fruit price distribution
2. Bar plot - Cup equivalent prices
3. Bar plot - Cup equivalent sizes
4. Scatter plot - Price vs Yield relationship
5. Pie chart - Form distribution
6. Bar plot - Average retail prices by form
7. Decision tree visualization

## Key Findings

### Market Distribution
- Fresh fruits are the most common form in the market
- Canned fruits achieve the highest yield
- Frozen fruits have the smallest market presence

### Pricing Insights
- Dried fruits command the highest average retail prices
- Juice has the lowest average retail price
- Most fruit prices range between 1-3 dollars
- Cherries are the most expensive per cup
- Watermelon is the cheapest per cup

### Price-Yield Relationship
- Lower prices correlate with higher yields
- Maximum yield occurs when prices are between 1-2 dollars
- Yield typically ranges between 0.9-1.0 for fruits priced above 2 dollars

## Challenges and Limitations

- Inconsistencies in measurement units (pounds vs fluid ounces)
- Limited geographical representation
- No temporal data for seasonal price variations
- Lacks detailed nutritional information
- Missing consumer demand data
- Limited information on processing methods

## File Structure

```
project my version/
├── project.R                    # Main R script
├── Visualization.txt            # Visualization code snippets
├── outputofpart1.txt           # Console output
├── Fruit Prices 2020.csv       # Dataset
├── .Rhistory                   # R command history
└── README.md                   # Project documentation
```

## Usage

### Loading Data

```r
library(readxl)
fruit_prices <- read_excel("path/to/Fruit-Prices-2020.xlsx")
print(fruit_prices, n=63)
```

### Running Shiny Application

```r
library(shiny)
shinyApp(ui = ui, server = server)
```

The Shiny app provides interactive buttons to explore different visualizations.

## Conclusions

This analysis reveals important patterns in fruit pricing and market distribution. Fresh fruits dominate the market, while canned fruits show the highest yield efficiency. Pricing strategies vary significantly by form, with dried fruits positioned as premium products and juice as the most economical option. The inverse relationship between price and yield suggests price sensitivity in consumer purchasing behavior.

## Future Work

- Incorporate temporal analysis for seasonal trends
- Add geographical data for regional price comparisons
- Include nutritional information for health-related insights
- Expand dataset to include more fruit varieties and forms
- Implement additional machine learning models for comparison

## License

This project was developed as part of the Introduction to Data Science course.
