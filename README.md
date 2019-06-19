# Presidential_Election

#Instructions
1. Download data 
    - Edwood - committe master file 
    - Amy- candidate master file 
    - Emily - Candidate Committee Linkage File 
    - Olivia - Contribution to Candidates File 
 2. Copy over the pgAdmin code (Template) into SQL script 
 3. Edit the code to create a new table
 5. Name the file "Import.sql"
 4. Run the script at the command line using `psql`
    - Repeat until you get it right
 6. Upload the file to GitHub (we are all working on this together)

Naming Conventions:
1. mast = master
2. cand = candidate 
3. cmte = committee

# How to add the `psql` binary to path
1. To find where the psql binary, use this code chunk to search within your application library (where the psql binary is):
```{bash, eval=FALSE}
find /Library  -name "psql"
```

2. Copy the path that identfies the binary. To permanently be able to access psql via terminal, you need to edit your .bash_profile file. To do this do:

`nano ~/.bash_profile`

Once you're in, paste your path into the file.

```{bash, eval=FALSE}
#psql library path
export PATH=/Library/PostgreSQL/11/bin:$PATH
```

3. Now echo your path to make sure you made the correct changes
`echo $PATH`

4. Type in `psql -U postgres` into the command line. This logs you into psql as the user "postgres". When asked for the password, enter the super user password you created when installing postgres. Not your computer's password. 

