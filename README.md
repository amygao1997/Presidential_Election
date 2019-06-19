FEC data
================

## Instructions

1.  Download data
      - Edwood - committe master file
      - Amy- candidate master file
      - Emily - Candidate Committee Linkage File
      - Olivia - Contribution to Candidates File
2.  Copy over the pgAdmin code (Template) into SQL script
3.  Edit the code to create a new table
4.  Name the file “Import.sql”
5.  Run the script at the command line using `psql`
      - Repeat until you get it right
6.  Upload the file to GitHub (we are all working on this together)

Naming Conventions: 1. mast = master 2. cand = candidate 3. cmte =
committee

## How to add the `psql` binary to path

1.  To find where the `psql` binary, use this code chunk to search
    within your application library (where the `psql` binary is):

<!-- end list -->

``` bash
find /Library -name "psql"
```

2.  Copy the path that identfies the binary. To permanently be able to
    access `psql` via terminal, you need to edit your `.bash_profile`
    file. To do this do:

<!-- end list -->

``` bash
nano ~/.bash_profile
```

Once you’re in, paste your path into the file.

``` bash
#psql library path
export PATH=/Library/PostgreSQL/11/bin:$PATH
```

3.  Now `echo` your path to make sure you made the correct changes:
    `echo $PATH`

4.  Type in `psql -U postgres` into the command line. This logs you into
    `psql` as the user `postgres`. When asked for the password, enter
    the super user password you created when installing `postgres`. Not
    your computer’s password.

# How to create the database in PgAdmin

1.  Right click `localhost` in the right side panel.
2.  Click Create \> Database…
3.  In the window, give the database a name and click save.

# How to create the table with your SQL script via psql

1.  Navigate to where your SQL script lives.

2.  Next log in as user `postgres` and point your database to the path
    of the script.

<!-- end list -->

``` bash
psql -U postgres [Insert your database name] < [Insert your SQL script name here]
```

For example,

``` bash
psql -U postgres Presidential_Election < import_candidate_master.sql
```

3.  If it runs, congratulations 🎉 if not, interpret the error message,
    fix the script, and go back to Step 2.

# Remove duplicates

Show the lines three above and below the offending line with line
numbers. Note the line number. Then delete the duplicate line.

``` bash
grep -n --context=3 "H8GA04117" cn.txt 
sed -i '1840d' cn.txt
```
