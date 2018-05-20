con <- file("en_US.twitter.txt", "r") 
?file
readLines(con, 1) ## Read the first line of text 

readLines(con, 1) ## Read the next line of text 

readLines(con, 5) ## Read in the next 5 lines of text 

close(con)  ## It's important to close the connection when you are done

###############################################################################
# Determine how many lines in en_US.twitter.txt

# Set WD
file.path <- "C:/Users/Werlindo/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
setwd( file.path )      
# dir()
# file.path <- paste( file.path, 'Coursera-Swiftkey/', sep='')
# file.path <- paste( file.path, 'final/', sep='')
# file.path <- paste( file.path, 'en_US/', sep='')
# file.path

conn <- file("en_US.twitter.txt",open="r")
read.size.of <- 20000
num.lines <- 0
( while( (lines.read <- length( readLines( conn, read.size.of ) ) ) > 0 ) 
      num.lines <- num.lines + lines.read )
close( conn )
num.lines
#2360148

###############################################################################
# Determine how many lines in en_US.twitter.txt
