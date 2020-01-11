# ETL-Project

### Proposal: 

#### Datasets Used:
1. https://www.baseball-reference.com/
2. https://www.seamheads.com/ballparks/index.php
3. https://en.wikipedia.org/wiki/List_of_current_Major_League_Baseball_stadiums

#### What useful investigation could be done with my final database?
My database will combine game schedule data for the Houston Astros for selected seasons with ballpark information for each game on the schedule. This database can be used to investigate whether ballpark aspects affect: player performance, team wins versus losses, game attendance by fans, etc. Furthermore, one could add on to this database and include weather data for each game day. Then the data could be used to investigate if weather affects performance, attendance, etc.

This database will be relational.

### Repository Guide
- **ETL_project.ipynb:** jupyter notebook with python script containing my extract, transform, and load process.
- **name_abbrv.csv:** csv file used as a datasource in my extract process
- **schema.sql:** schema of my SQL database
