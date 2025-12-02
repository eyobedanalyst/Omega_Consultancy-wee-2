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
# Sentiment Analysis Demo – README

This project demonstrates a **sentiment analysis pipeline** on a synthetic dataset of bank mobile app reviews using both **lexicon-based methods** (TextBlob and VADER) and **unsupervised NLP techniques** (Bag-of-Words, TF-IDF, LDA topic modeling, and noun extraction).

---

## 📁 Dataset Overview

- **10 synthetic user reviews** with star ratings (1–5)
- Ratings mapped to sentiment labels:
  - `1–2` → **negative**
  - `3` → **neutral**
  - `4–5` → **positive**

Example reviews:
> “Exceptional product, very easy to use and fast.” (⭐5)  
> “It is really slow and always crashing. Very frustrating!” (⭐1)

---

## 🧰 Requirements

Install required packages:

```bash
pip install pandas numpy matplotlib seaborn scikit-learn nltk textblob gensim spacy
```

### Download dependencies

```python
import nltk
nltk.download('vader_lexicon')
nltk.download('stopwords')
```

```bash
python -m spacy download en_core_web_sm
```
🚀 Pipeline Steps
1. Text Preprocessing
Convert to lowercase
(Optional extensions: stopword removal, lemmatization)
2. Text Representation
Bag-of-Words (CountVectorizer): Raw word frequencies
Top word: "app" (count = 3)
TF-IDF (TfidfVectorizer): Weights words by importance
"app" (TF-IDF = 0.1099) — highly important
Negative keywords: "slow", "crashing", "frustrating"
TF-IDF Insight: Better highlights meaningful terms than raw frequency by penalizing common words.

3. Topic Modeling (LDA)
2 Topics Identified:
Topic 1 – Positive Experience:
app, super, easy, everything, tap → ease of use, convenience
Topic 2 – Feature Complaints:
options, payment, limited, updating, frustrating → missing features & instability
4. Noun Extraction (spaCy)
Extracts key aspects users mention:

["product"], ["app", "job"], ["Bill", "payment", "options"], ["design", "user"], etc.
Useful for aspect-based sentiment analysis.

5. Lexicon-Based Sentiment
✅ TextBlob
Polarity ∈ [–1, 1]
Labels based on thresholds:
polarity > 0.1 → positive
polarity < –0.1 → negative
Limitation: Mislabels neutral reviews (e.g., review #3 labeled as positive)
✅ VADER (Valence Aware Dictionary for sEntiment Reasoning)
Optimized for short, informal text (e.g., app reviews)
Uses compound score ∈ [–1, 1]
Standard thresholds:
compound ≥ 0.05 → positive
compound ≤ –0.05 → negative
Better alignment: Review #7 (“It’s okay…”) correctly labeled neutral
6. Visualization
Bar chart: Top 10 frequent words (Bag-of-Words)
Scatter plots:
TextBlob Polarity vs. Star Rating
VADER Compound Score vs. Star Rating

# bank_reviews

Contents:
- schema.sql        -> DB schema for banks + reviews
- docker-compose.yml -> optional local Postgres
- scripts/
  - insert_reviews.py
  - analysis.py
  - visualize.py
  - generate_synthetic.py

How to run (quick):
1. Start Postgres (Docker): docker-compose up -d
2. Apply schema:
   psql -h localhost -U postgres -d bank_reviews -f schema.sql
3. Insert data:
   python scripts/insert_reviews.py --csv data/reviews.csv --db-uri "postgresql://postgres:postgrespw@localhost:5432/bank_reviews"
4. Analysis:
   python scripts/analysis.py --db-uri "postgresql://postgres:postgrespw@localhost:5432/bank_reviews" --out-dir output
5. Visualize:
   python scripts/visualize.py --db-uri "postgresql://postgres:postgrespw@localhost:5432/bank_reviews" --input-dir output --figdir figures

Deliverables:
- Working DB connection with data (>1000 rows)
- scripts inserted in repo
- figures/ with plotted PNGs
- output/kpi_summary.csv and top_keywords_per_bank.csv
- schema.sql and pg_dump in repo
