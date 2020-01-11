# ETL-Project

## Proposal: 

#### Datasets Used:
1. https://www.baseball-reference.com/
2. https://www.seamheads.com/ballparks/index.php
3. https://en.wikipedia.org/wiki/List_of_current_Major_League_Baseball_stadiums

#### What useful investigation could be done with my final database?
My database will combine game schedule data for the Houston Astros for selected seasons with ballpark information for each game on the schedule. This database can be used to investigate whether ballpark aspects affect: player performance, team wins versus losses, game attendance by fans, etc. Furthermore, one could add on to this database and include weather data for each game day. Then the data could be used to investigate if weather affects performance, attendance, etc.

This database will be relational.

## Repository Guide:
- **ETL_project.ipynb:** jupyter notebook with python script containing my extract, transform, and load process
- **name_abbrv.csv:** csv file used as a datasource in my extract process
- **schema.sql:** schema of my SQL database

## Final Report: 

For my project, I created a database for the Houston Astros previous seasons schedules and corresponding ballpark data. 

I began my extraction process by identifying the data sources I would use to pull my data. The first data source I chose was baseball_reference.com. The webpage provides season schedules for all MLB teams, including the Houston Astros. I scraped the Houston Astros season schedule webpage for tabular data in a loop, scraping the 2017, 2018 and 2019 seasons schedule into separate dataframes. Within this loop, I began transforming my data by dropping unnecessary columns and adding a column to identify season year. I then combined each seasons dataframe into one large dataframe. 

The data did not include a column explicitly stating where the game was played. This became my primary transformation for this data. The data included a column identifying the team (Houston Astros), a column identifying the opposing team and a column with a value “@” or null which identified whether the game was “@” the opposing team or not (null). I transformed this column to define clearly whether the game was “home” versus “away”. I then created a column which identified the location of the game based on the team name abbreviation. I filled this column by iterating over the dataframe rows, if the row was “away” the location column equaled the opposing team’s abbreviation. If the row was “home” the location column equaled home team abbreviation. Finally, I renamed my column headers to be more informative and consistent. 

I also pulled team franchise data from baseball_reference.com and saved it as its own dataframe. The main transformation I made to this data was filtering it to include only the present franchises. I also renamed the column headers to be consistent and clearly identify the data relates to team franchises.

The second data source I chose was Wikipedia (specifically: https://en.wikipedia.org/wiki/List_of_current_Major_League_Baseball_stadiums). This wiki webpage provides a table of the current MLB ballparks. I scraped this webpage for its tabular data and stored it into a dataframe. The wiki table values had subscripts with links to other wiki pages. When I pulled the data into a pandas dataframe, the subscripts pulled in as text. The bulk of my transformation for this data was removing the subscript text from my dataframe values. I also renamed the column headers to be consistent and clearly identify the data relates to ballpark information. 

At this point, I noticed that the dataframes differed slightly in how they referenced teams by name or abbreviation. However, none of the dataframes were referencing a team incorrectly, there are just several acceptable ways to refer to an MLB team. In order to merge my three dataframes accurately, I created a csv file which included each dataframes team reference column. In other words, the file has a row for each MLB team with three different reference names/abbreviations. This csv file was my third data source. I imported the csv file into pandas and created a dataframe. Using this dataframe, I was able to merge all my dataframes into one master dataframe. 

My database is relational, and I chose to load my data into SQL. Each of my dataframes make up the tables within my SQL database. The following outlines my schema (I have also included a file of my database schema in my repository):

- *Table: reference.* This table identifies how a team is referenced throughout the database. It has three columns, each providing how the team is referenced relative to one of the databases table. Each reference column is a foreign key. Column “team_name_fran” is a foreign key with a one to one relationship to the franchise table. Column “team_name_bp” is a foreign key with a one to one relationship to the parks table. Column “location_team_abbrv” is a foreign key with a one to many relationships to the schedule table.

- *Table: franchise.* This table includes current MLB franchise data. Specifically, it includes the franchise id, team id, team name, and when the franchise began and end. The primary key for this table is “team_name_fran” which, in other words, is the team name. 

- *Table: parks.* This table includes current MLB ballparks data. It includes information such as park capacity, year park opened, surface of ballpark field (i.e. grass versus turf), roof type, location (city and state), etc. The primary key for this table is “team_name_bp”, which, like the franchise table, is the team name. 

- *Table: schedule.* This is the largest table in my database. It includes game schedule data for the Houston Astros for the 2017, 2018, and 2019 season. The table includes the game number (i.e. game number 5 of the 2017 season), date and time of game, opposing team, attendance, stats on the outcome of the game (i.e. win/loss, runs scored, runs allowed, win/loss record, innings, rank after game, streak, etc.) and more. The column “location_team_abbrv” is a foreign key with a many to one relationship to the reference table. 

By utilizing the reference table, one could combine these tables into on large dataset. I essentially did this in my python script, merging the dataframes into one. I originally thought the combined single dataframe would be my final database product. As I began the “loading” process, I realized that, for the datasets to be easily accessed and reassembled in many different ways, my database should be stored in an object-relational database system like Postgres where a management tool like pgAdmin can be utilized to interact with the tables of my dataset. From there, one can merge the tables as one large table, if they choose. Which leads to the hypothetical uses of my database.

My initial vision was to create a database that could be used to analyze an MLB team’s performance based on the location of the game. My final product is not far from that vision. With the database I created, one could hypothetically use it for the following cases:
- Analyze the outcome of Houston Astros games and whether the ballpark location has any correlation to the outcome results
- Analyze game attendance and any correlation to ballpark location 

If I had more time, I would have extracted data from a weather API and add a table which provided the weather at the time and location of each game. With this additional table, one could analyze whether performance has any correlation to weather. 
