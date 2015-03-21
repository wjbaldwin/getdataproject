# Desceiption
This is the repository for the course project for the Coursera course: "Getting and Cleaning Data". This repository should contain this README.md file, and the data analysis R script run_analysis.R.

# How To Use the Script
The R script run_analysis.R is to be run on the data supplied by the course. The data is assumed to be in located in the working directory and unpacked from the .zip file. This will create a subdirectory "UCI HAR Dataset" that contains all of the data required for this analysis.

When the script is run, it will access the data in the expected directory structure. If the data doesn't exist, the script will fail.

The output of the script is a file called results.txt. This file was written with the line:
```{r}
write.table(tidy_data, file="results.txt", row.name=FALSE)
```

To read it back in, use the line:
```{r}
read.table("results.txt", header=TRUE)
```

The data can then be viewed and manipulated in whatever manner you wish.

See CodeBook.md for the relevant codebook information. Note that some of the information is already included in the features_info.txt file in the given data.
