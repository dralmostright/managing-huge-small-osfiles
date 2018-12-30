#################################################################################
## Author : Suman Adhikari                                                     ##
## Company : XXXXXXXXXXXXXXXXXX                                                ##
## Date : 2017-04-26                                                           ##
#################################################################################
## Description of variables                                                    ##
#################################################################################
## filesDir : Staging Directory to copy the small files.                       ##
## tarDir   : Directory to compress the files.                                 ##
## tarFileName : Compressed Chunk file name.                                   ##
## curDir   : Get the current directory.                                       ##
## j        : Counter to list the number of files processed.                   ##
## k        : Counter to check the chunk size.                                 ##
## tempJ    : Variable to hold the current value of J before increment.        ##
#################################################################################
## Purpose:                                                                    ##
#################################################################################  
## The scripts takes the list of small files in file named text.txt.It iterates##
## over the text.txt file and copies the small files to staging area: filesDir.##
## When the chunk size of 500 is met script compress the all file in staging   ##
## area : filesDir to filename : tarFileName. After compressing the files it   ##
## removes the small files from staging directory : filesDir. With successful  ##
## execution of the script all the small files are compressed to directory :   ##
## tarDir with 500 in each.                                                    ##
#################################################################################

##
## Change the directory containing large number of small files.
##
cd /home/oracle/scripts/audit

##
## Initialize the counter variables.
##
j=0
k=0

##
## Iterate over the list given in test.txt.
##
  while IFS= read <&3 -r i; do
      
	  ##
	  ## Check if the chunk size is reached.
	  ##
	  if [ ${k} = "500" ]
         then
		 
         ##
         ## Temporarily hold the value of j with 1 increment.
         ##
           tempJ=1
           let "tempJ=tempJ+j"
         
         ##
         ## Increment the the value of j.
         ##
           let "j=j+k"
         
         ##
         ## Reset the value of k when the chunk size is reached.
         ##
           k=1
		 
		 ##
		 ## Set the Directories .
		 ##
           curDir=`pwd`
           filesDir=/home/oracle/scripts/test
           tarDir=/home/oracle/scripts/tardir/
         
		 ##
		 ## Generate the tar file name.
		 ##
		   tarFileName=${tarDir}SVBO_aud_${tempJ}_${j}.tar
         
		 ##
		 ## Switch to the staging Directory and compress files.
		 ##
           cd $filesDir
           tar -cf $tarFileName *.xml
		 
		 ##
		 ## After compressing delete files from the staging directory.
		 ##
           rm *.xml
         
		 ##
		 ## After successful deletion and compress switch to orginal directory.
		 ##
           cd $curDir
         
     ##
     ## If the chunk size is not met increment the chunk size counter.
     ##
     else
          ((k+=1))
     fi
	 
 ##
 ## Move the files to Staging Directory. 
 ##
 mv "$i" /home/oracle/scripts/test
 done 3< ../test.txt
