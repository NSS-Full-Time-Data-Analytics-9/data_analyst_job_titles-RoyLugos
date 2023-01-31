-- The dataset for this exercise has been derived from the `Indeed Data Scientist/Analyst/Engineer` [dataset](https://www.kaggle.com/elroyggj/indeed-dataset-data-scientistanalystengineer) on kaggle.com. 

-- Before beginning to answer questions, take some time to review the data dictionary and familiarize yourself with the data that is contained in each column.

-- #### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:


-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

-- Answer: 1793 rows


-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- Answer: ExxonMobil


-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(location) AS tn_postings
FROM data_analyst_jobs
WHERE location = 'TN';

-- Answer: 21 postings in Tennessee

SELECT COUNT(location) AS tn_or_ky_postings
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY');
	
-- Answer: 27 postings in either Tennessee or Kentucky


-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT COUNT(location) AS tn_postings_with_star_ratings_above_4
FROM data_analyst_jobs
WHERE location = 'TN'
	AND star_rating > 4;
	
-- Answer: 3 postings in Tennessee with star ratings above 4.


-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count) AS review_count_between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Answer: 151 postings in the dataset have a review count between 500 and 1000.


-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
	AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- Answer: see table below.  Nebraska shows the highest average rating.
-- "NE"		4.1999998090000000
-- "RI"		4.1499998570000000
-- "KS"		4.0999999050000000
-- "UT"		4.0647057644117647
-- "ID"		4.0000000000000000
-- "LA"		4.0000000000000000
-- "DE"		3.9500000475000000
-- "NH"		3.9499999285000000
-- "WA"		3.9441860110232558
-- "MA"		3.8932432129459459
-- "CA"		3.8787233887386018
-- "NY"		3.8646464540202020
-- "IN"		3.8500000106111111
-- "DC"		3.8333333576666667
-- "VA"		3.8295774694225352
-- "TN"		3.8277777831111111
-- "SC"		3.8214285541428571
-- "CT"		3.8178571376785714
-- "OR"		3.8176470224117647
-- "NC"		3.8071428195714286
-- "AR"		3.7999999522857143
-- "AL"		3.7500000000000000
-- "GA"		3.7439999818600000
-- "NV"		3.7428571494285714
-- "MI"		3.7406249716562500
-- "CO"		3.7285714036190476
-- "IL"		3.7219999885200000
-- "WI"		3.7181818268181818
-- "TX"		3.7135922445631068
-- "OK"		3.7000000480000000
-- "REMOTE"	3.6999999680000000
-- "PA"		3.6959999751800000
-- "FL"		3.6923076678205128
-- "MO"		3.6677418984516129
-- "IA"		3.6666666136666667
-- "MD"		3.6400000148000000
-- "OH"		3.5903225790000000
-- "KY"		3.5799999716000000
-- "NJ"		3.5725490204509804
-- "AZ"		3.5714285543571429
-- "MN"		3.5681818181818182
-- "USA"	3.5611111057777778
-- "NM"		3.5000000000000000
-- "ME"		3.4999999998000000
-- "HI"		3.4000000950000000
-- "WV"		3.4000000950000000


-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT (DISTINCT title) AS unique_job_titles
FROM data_analyst_jobs;

-- Answer: 881 unique job titles.


-- 8.	How many unique job titles are there for California companies?

SELECT COUNT (DISTINCT title) AS unique_job_titles_for_california_companies
FROM data_analyst_jobs
WHERE location = 'CA';

-- Answer: 230 unique job titles for California companies


-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating, SUM(review_count) AS total_review_count
FROM data_analyst_jobs
WHERE review_count > 5000
	AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

-- Answer: see table below for the name of each company and its average star rating for all companies that have more than 500 reviews across all locations.  There are 40 companies with more than 5000 reviews across all locations.

-- company_name	avg_star_rating		total_review_count
-- "Unilever"	4.20	5416
-- "General Motors"	4.20	6241
-- "Nike"	4.20	13148
-- "American Express"	4.20	18111
-- "Microsoft"	4.20	31068
-- "Kaiser Permanente"	4.20	122460
-- "Lockheed Martin Corporation"	4.10	57735
-- "Siemens"	4.10	12958
-- "Starbucks"	4.10	55716
-- "Cognizant"	4.00	41964
-- "Capital One"	4.00	40741
-- "HP"	4.00	32472
-- "Accenture"	4.00	134888
-- "PwC"	4.00	5988
-- "Deloitte"	4.00	28788
-- "Dell"	4.00	8696
-- "Nordstrom"	4.00	8955
-- "PepsiCo"	3.90	10791
-- "JPMorgan Chase"	3.90	380862
-- "IBM"	3.90	93893
-- "Citi"	3.90	14629
-- "Honeywell"	3.80	12994
-- "Wipro LTD"	3.80	11485
-- "Capgemini Government Solutions"	3.80	6072
-- "Capgemini"	3.80	333960
-- "Wells Fargo"	3.80	209750
-- "The Home Depot"	3.80	123870
-- "State Farm"	3.80	8531
-- "Comcast"	3.70	12326
-- "PetSmart"	3.70	6850
-- "SUBWAY"	3.70	66164
-- "U.S. Bank"	3.70	23944
-- "Aramark"	3.60	13098
-- "Walmart"	3.60	787299
-- "Staples"	3.60	9416
-- "Goodwill Industries International, Inc. (GII)"	3.60	14245
-- "Kroger"	3.60	24248
-- "Advance Auto Parts"	3.50	5042
-- "Meijer"	3.50	6797
-- "Burlington Stores"	3.40	6742


-- Extra code for question #9 for practice purposes
-- 9.  (Continued) How many companies are there with more that 5000 reviews across all locations?

SELECT company, SUM(review_count) AS total_review_count
FROM data_analyst_jobs
WHERE review_count > 5000
	AND company IS NOT NULL
GROUP BY company
ORDER BY total_review_count DESC;


-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- Comment: Already did the code for question 10 in question 9, plus the rounding to 2 decimal places for the average start rating.

SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating, SUM(review_count) AS total_review_count
FROM data_analyst_jobs
WHERE review_count > 5000
	AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

-- Answer: Unilever had the highest star rating of 4.20.


-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT COUNT(DISTINCT(title)) AS job_titles_containing_the_word_analyst
FROM data_analyst_jobs
WHERE title LIKE '%NALYST%'
	OR title LIKE '%nalyst%';

-- Answer: 774 different job titles


-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT COUNT(DISTINCT(title)) AS job_titles_not_containing_analyst_or_analytics
FROM data_analyst_jobs
WHERE title NOT LIKE '%NALYST%'
	AND title NOT LIKE '%nalyst%'
	AND title NOT LIKE '%NALYTICS%'
	AND title NOT LIKE '%nalytics%';

--Answer: 4 job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’.  Those 4 job titles have the word 'data' in common.


-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--  - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT domain, COUNT(title) AS number_of_jobs_requiring_SQL_posted_longer_than_3_weeks
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
	AND days_since_posting > 21
	AND domain IS NOT null
GROUP BY domain
ORDER by number_of_jobs_requiring_SQL_posted_longer_than_3_weeks DESC;

-- Answer: 
-- Industries							# of jobs listed for more than 3 weeks
-- "Internet and Software"				62
-- "Banks and Financial Services"		61
-- "Consulting and Business Services"	57
-- "Health Care"						52
