Casey Muhs

1) Write a query to select all of the columns in the tutorial.us_housing_units table without using *.
SELECT year,
       month,
       month_name,
       south,
       west,
       midwest,
       northeast
  FROM tutorial.us_housing_units
This selects all the column titles from the database.

2) Write a query to select all of the columns in tutorial.us_housing_units and rename them so that their first letters are capitalized.
SELECT year AS "Year",
       month AS "Month",
       month_name AS "Month Name",
       south AS "South",
       west AS "West",
       midwest AS "Midwest",
       northeast AS "Northeast"
  FROM tutorial.us_housing_units
The 'AS' command is the renaming process. You call the column title and rename it something else.

3) Write a query that uses the LIMIT command to restrict the result set to only 15 rows.
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 15
The 'LIMIT' command only selects the amount given to run

4) Did the West Region ever produce more than 50,000 housing units in one month?
SELECT *
  FROM tutorial.us_housing_units
  WHERE west > 50
Yes, 3. Select everything but west has to be greater than 50(thousand)

5) Did the South Region ever produce 20,000 or fewer housing units in one month?
SELECT *
  FROM tutorial.us_housing_units
  WHERE south <= 20
Yes, 4. Selecting everything but south has to be less than or equal to 20(thousand)

6) Write a query that only shows rows for which the month name is February.
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name = 'February'
Selecting everything but the month has to be february

7) Write a query that only shows rows for which the month_name starts with the letter "N" or an earlier letter in the alphabet.
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name < 'O'
Selecting everything less than 'O' which is 'N' and up

8) Write a query that calculates the sum of all four regions in a separate column.
SELECT *,
       south + west + midwest + northeast AS region_sum
  FROM tutorial.us_housing_units
Selecting everything and including a seperate column for a calculation from 4 columns

9) Write a query that returns all rows for which more units were produced in the West region than in the Midwest and Northeast combined. (Would it matter if there are parenthesis or not?)
SELECT *
  FROM tutorial.us_housing_units
  WHERE west > (midwest + northeast)
Selecting everything but west had to be more than midwest and northeast combined so a formula was calculated

10) Write a query that calculates the percentage of all houses completed in the United States represented by each region. Only return results from the year 2000 and later.
Hint: There should be four columns of percentages.
SELECT year,
       month,
       south / (south + west + midwest + northeast) * 100 AS south_pct,
       west / (south + west + midwest + northeast) * 100 AS west_pct,
       midwest / (south + west + midwest + northeast) * 100 AS midwest_pct,
       northeast / (south + west + midwest + northeast) * 100 AS northwest_pct
  FROM tutorial.us_housing_units
  WHERE year >= 2000
This one was fun. Upon selecting everything you have a twist! Four of the columns are being changed into a percentage! Oh the audacity! Which really just means we select the column and divide it by all the columns combined. Yet the only way to do this is with parenthesis b/c order of operations is very key in programming. From there you multiply it by 100 and rename it as something new! But we have another catch! It can only be from 2000 and later.

11) Write a query that returns all rows for which Ludacris was a member of the group.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%ludacris%'
Selecting everything, using the '%' wildcard sign. This sign is for selecting everything in front or behind a word or character. 

12) Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".
--Disclaimer: LIKE and ILIKE both output same output
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE "group" LIKE 'DJ%'
Selecting everything but the first artist has to start with DJ. Yet again calling the wildcard but only to sit behind "DJ" to hype up his followers.

13) Write a query that shows all of the entries for Elvis and M.C. Hammer.
Hint: M.C. Hammer is actually on the list under multiple names, so you may need to first write a query to figure out exactly how M.C. Hammer is listed. You're likely to face similar problems that require some exploration in many real-life scenarios.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')
For real, is Jon Hammer MC Hammer too???? If not cool, but like kinda tripped me up. Selecting everything but the artist has to be in the words given

14) Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1985 AND 1990
Selecting everything. So fun things about between cases, when you specify the entire year, you get the entire year! So it'll only select those years!

15) Write a query that shows all of the rows for which song_name is null.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE song_name ISNULL
I know a loophole! Haha previous learning! So this is selecting everything but the song name has to be null or none. The answer given is the same except "...IS NULL", both ways work. One is a command already given and thus easier to use in different cases required. I just prefer this way more.

16) Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%Ludacris%'
  AND year_rank <= 10
Selecting everything but again Ludacris needs to be included into everything so we call the wildcard to find his friends. BUT WAIT THERES MORE! He only wanted to find the top ten so we calculated that in too b/c AND can do almost everything.

17) Write a query that surfaces the top-ranked records in 1990, 2000, and 2010.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  AND year IN (1990, 2000, 2010)
Selecting everything but it has to be a top hit in specified years. Where is calling what rank, while something new has happened. You can call your column but specify what exactly you want to call by the IN command. Each thing, whether it's number, word, or character is called but only those. Be carefull when calling words as they'll need commas to surround each word

18) Write a query that lists all songs from the 1960s with "love" in the title.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 and 1969
  and "song_name" ILIKE '%love%'
Selecting everything but the years have to be in 1960-1969 which is called with between and AND. While also selecting every song that has love in it using the wildcard and calling duplicates

19) Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi. 
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 10
    AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%bon jovi%')
Selecting everything but only both katy and bon jovi. Now while saying 'and' I'm completely true while you notice the OR command. I can call both katy and/or bon jovi and they'll still come up together in the output. Although not together b/c katy perry shouldn't try to make a song with bon jovi

20) Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE song_name LIKE '%California%'
    AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999)
Selecting everything but using the wildcard to find all the songs that have california in it and specifying years. OR looks for both sides and between is called.

21) Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%Dr. Dre%'
    AND (year <= 2000 OR year >=2010)
Selecting everything but Dre wanted to be included with everything in the groups so the wildcard is used. He only wanted 2000 and prior, while also 2010 and later. OR command is looking for both clauses and returns only that.

22) Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".
SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year = 2013
    AND song_name NOT ILIKE '%a%'
Selecting everything but only from 2013, and apparently someone doesn't like the letter 'a'. Geez. Using NOT ILIKE, it's stops all duplicates and the given word or character. Wildcard for calling it everywhere in the song title

23) Write a query that returns all rows from 2012, ordered by song title from Z to A.
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 2012
  ORDER BY song_name DESC
Selecting everything but only in 2012 and ordering the song names in descending order.

24) Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song. 
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 2010
  ORDER BY year_rank, artist
Selecting everything but only in 2010 and ordering first by year rank and then by artist

25) Write a query that shows all rows for which T-Pain was a group member, ordered by rank on the charts, from lowest to highest rank (from 100 to 1).
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%T-Pain%'
  ORDER BY year_rank DESC
Selecting everything but T-Pain needed to be included. Yet he's having a pity party and wanted to look at what songs flopped. PLOT TWIST, he's getting inspiration for better songs! 

26) Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. Order the results by year and rank, and leave a comment on each line of the WHERE clause to indicate what that line does
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 10 AND 20 --indicates to look only for ranks 10-20
  AND year IN (1993, 2003, 2013) --indicates to these specific years
  ORDER BY year, year_rank
Selecting everything but only between year rank 10-20 while also commenting that. Here's that IN command calling given for years. And we're ordering first by year and then by year rank

