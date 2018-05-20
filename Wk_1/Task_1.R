con <- file("en_US.twitter.txt", "r") 
?file
readLines(con, 1) ## Read the first line of text 

readLines(con, 1) ## Read the next line of text 

readLines(con, 5) ## Read in the next 5 lines of text 

close(con)  ## It's important to close the connection when you are done

###############################################################################
# Determine how many lines in en_US.twitter.txt
conn <- file("en_US.twitter.txt",open="r")
read.size.of <- 20000
num.lines <- 0
while ( (lines.read <- length( readLines( conn, read.size.of ) ) ) > 0 ) {
      num.lines <- num.lines + lines.read
}
close( conn )
num.lines
#2360148

###############################################################################
# Set WD
# file.path <- "C:/Users/Werlindo/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
file.path <- "D:/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
getwd()
setwd( file.path )      

# One way
set.seed(5429)

#Initialize
sample.max <- 100
ctr = 0
df.twit <- data.frame( tweet = character() )

conn <- file("en_US.twitter.txt",open="r")

# Flip coin, if 1 add to dataframe
while( ctr < sample.max ) {
  df.temp <- data.frame( as.character(readLines( conn, 1 ) ) )                 
  colnames( df.temp ) <- c( 'tweet' )
  
  if ( rbinom( 1, 1, 0.5 ) == 1 ) {
    df.twit <- rbind( df.twit, df.temp )                 
    ctr<- ctr + 1
  }
}

close( conn )

# get value of longest character
tweet.lengths <- sapply( df.twit$tweet, nchar )
max( tweet.lengths )

# Final version
files <- dir()

file.name <- character()
maxes <- numeric()
res <- data.frame( file.name, maxes )

ctr <- 1

# for ( i in 1:10000 ){
for ( curr.file in files ){
  conn <- file(curr.file,open="r")
  longest = 0
  
  while ( TRUE ) {
        # print( nchar( readLines( conn, 1 ) ) )
        curr <- nchar( readLines( conn, 1 ) )
        # print(curr)
        longest <- max( longest, curr  ) 
        if ( length(curr) == 0 ) {
          print( 'Done!' )
          break
        }
  }
  close( conn )
  #Record results
  res <- rbind( data.frame( curr.file, longest ), res )
  
}

res


