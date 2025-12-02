# Google Play Store Review Scraping & Preprocessing

## Week 2 – OMEGA Consultancy Project

# Overview

This repository contains the full workflow for scraping, cleaning, and preprocessing Google Play Store reviews for three selected banking applications. The goal of Task 1 is to collect at least 1,200+ reviews (minimum 400 per bank), preprocess them for analysis, and maintain a clean, well-structured GitHub repository with modular code.

Repository Structure
OMEGA_CONSULTANCY-WEE-2/
│
├── data/
│   ├── processed/
│   │   └── reviews_processed.csv        # Cleaned final dataset
│   └── raw/
│       ├── reviews_raw.csv             # Raw scraped reviews
│       └── app_info.csv                # App metadata (optional)
│
├── notebooks/
│   └── ...                             # Jupyter notebooks for exploration
│
├── scripts/
│   ├── config.py                       # Configuration (bank list, app IDs, paths)
│   ├── preprocessing.py                # Final preprocessing script
│   └── preprocessing_EDA.ipynb         # Notebook-based exploratory preprocessing
│
├── scraper.py                           # Script for scraping Google Play reviews
│
├── src/                                 # Future modular code (optional)
│
├── tests/                               # Placeholder for unit tests
│
├── venv/                                # Python virtual environment
│
├── requirements.txt                     # Project dependencies
├── .gitignore                           # Ignored files & folders
└── README.md                            # Documentation

Task 1 Objectives
1. GitHub Setup

Create a repository and configure a .gitignore file.

Add requirements.txt with all dependencies.

Work using a dedicated branch named task-1.

Commit frequently with meaningful commit messages.

2. Web Scraping (google-play-scraper)

The script scraper.py collects:

Review text

Rating

Review date

App name

Bank label

Source (Google Play Store)

Target

3 banking apps

400+ reviews per bank → minimum 1,200 reviews

Results are saved in:

data/raw/reviews_raw.csv

3. Preprocessing

Performed in scripts/preprocessing.py, including:

Remove duplicate reviews

Handle missing values (<5% allowed)

Normalize dates to YYYY-MM-DD

Standardize column names

Add metadata fields (bank, source)

Export final cleaned dataset as:

data/processed/reviews_processed.csv

Final Dataset Schema
Column	Description
review	Cleaned review text
rating	Numerical rating (1–5)
date	Normalized date (YYYY-MM-DD)
bank	Bank name label
app_name	Name of the mobile app
source	Data origin (Google Play Store)
KPIs & Deliverables
Deliverable	Status
≥ 1,200 total reviews	Required
< 5% missing values	Required
Clean CSV export	Required
Modular preprocessing script	Required
README with methodology	Required
Organized GitHub repo	Required
Installation & Setup
Clone the repository
git clone <your_repo_url>
cd OMEGA_CONSULTANCY-WEE-2

Create & activate virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

Install dependencies
pip install -r requirements.txt

How to Run the Pipeline
1. Scrape the data
python scraper.py

2. Run preprocessing
python scripts/preprocessing.py

Branch & Version Control Strategy

Work is performed in the following dedicated branch:

task-1


Commit guidelines:

Commit after completing logical units of work.

Use descriptive commit messages (e.g., “Add preprocessing pipeline”).

Future Work (Next Tasks)

Sentiment analysis

Topic modeling

Dashboard/report generation

CI/CD workflow for automated testing