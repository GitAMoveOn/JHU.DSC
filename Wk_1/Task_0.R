# getwd()
# setwd('..')
# dir()
# setwd('./10. Capstone/JHU.DSC/')
# setwd('./Data/')
# getwd()
file.path <- "C:/Users/Werlindo/Dropbox/Coursera/10. Capstone/JHU.DSC/Data/"
file.path <- paste( file.path, 'Coursera-Swiftkey/', sep='')
file.path <- paste( file.path, 'final/', sep='')
file.path <- paste( file.path, 'en_US/', sep='')
setwd( file.path )      
file.path
dir()

# Look at one of the tables
data.twit <- read.table( 'en_US.twitter.txt',sep='\t', nrows = 100 )
data.blog <- read.table( 'en_US.blogs.txt',sep='\t', nrows = 100 )

head(data.twit)
head(data.blog)
