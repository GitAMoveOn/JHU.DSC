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
# Get longest line out of all en_US files

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

###############################################################################
# In the en_US twitter data set, if you divide the number of lines where the word "love" 
# (all lowercase) occurs by the number of lines the word "hate" (all lowercase) occurs, 
# about what do you get?


#Testing
file.path <- "C:/Users/Werlindo/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
#file.path <- "D:/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
getwd()
setwd( file.path )      

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

df.twit$tweet <- as.character( df.twit$tweet )

nchar( df.twit$tweet[1] )

tweets <- df.twit$tweet

head( tweets )

grepl( 'heart', tweets[1] ) * 1 

sum( grepl( 'heart', tweets ) * 1 )


for ( i in 1:length( tweets ) ) {
 print( nchar( tweets ) )     
}
?grep

#######################
# Now for real

file.path <- "C:/Users/Werlindo/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
#file.path <- "D:/Dropbox/Coursera/10. Capstone/Data/Orig/en_US/"
getwd()
setwd( file.path )      

conn <- file("en_US.twitter.txt",open="r")
love = 0
hate = 0

# count 'love' 
while ( TRUE ) {
      # print( nchar( readLines( conn, 1 ) ) )
      curr <- readLines( conn, 1 )
      # print(curr)
      if ( length(curr) == 0 ) {
            print( 'Done!' )
            break
      }     
      love <-( grepl( 'love', curr  ) * 1 ) + love 

}
close( conn )
love
#90956

# count 'hate' 
conn <- file("en_US.twitter.txt",open="r")
while ( TRUE ) {
      # print( nchar( readLines( conn, 1 ) ) )
      curr <- readLines( conn, 1 )
      # print(curr)
      if ( length(curr) == 0 ) {
            print( 'Done!' )
            break
      }     
      hate <-( grepl( 'hate', curr  ) * 1 ) + hate 
      
}
close( conn )
hate
#22138

love/hate
# 4.108592

#############################################################################
#The one tweet in the en_US twitter data set that matches the word "biostats"
#says what?

conn <- file("en_US.twitter.txt",open="r")
while ( TRUE ) {
      # print( nchar( readLines( conn, 1 ) ) )
      curr <- readLines( conn, 1 )
      if ( grepl( 'biostats', curr  ) ) {
            found.it <- curr
      }     
      if ( length(curr) == 0 ) {
            print( 'Done!' )
            break
      }       
}
close( conn )
found.it

#############################################################################
# How many tweets have the exact characters "A computer once beat me at
# chess, but it was no match for me at kickboxing". 
# (I.e. the line matches those characters exactly.)

ctr = 0 

conn <- file("en_US.twitter.txt",open="r")
while ( TRUE ) {
      # print( nchar( readLines( conn, 1 ) ) )
      curr <- readLines( conn, 1 )
      if ( grepl( 'A computer once beat me at chess, but it was no match for me at kickboxing', curr  ) ) {
            ctr = ctr + 1
      }     
      if ( length(curr) == 0 ) {
            print( 'Done!' )
            break
      }       
}
close( conn )
ctr