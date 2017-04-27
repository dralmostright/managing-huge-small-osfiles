# Manage huge number of small O/S files in UNIX

## Author

Author : Suman Adhikari                                                                                                    
Date : 2017-04-26                                                           

## Description of variables

The below listed variables used for controlling the script
                                                   
1. filesDir : Staging Directory to copy the small files.                      
2. tarDir   : Directory to compress the files.                                
3. tarFileName : Compressed Chunk file name.                                  
4. curDir   : Get the current directory.                                      
5. j        : Counter to list the number of files processed.                  
6. k        : Counter to check the chunk size.                                
7. tempJ    : Variable to hold the current value of J before increment.       

## Purpose:                                                                  
 
The scripts takes the list of small files in file named text.txt.It iterates over the text.txt file and copies the small files to staging area: filesDir. When the chunk size of 500 is met script compress the all file in staging area : filesDir to filename : tarFileName. After compressing the files it removes the small files from staging directory : filesDir. With successful execution of the script all the small files are compressed to directory : tarDir with 500 in each.                                                    


