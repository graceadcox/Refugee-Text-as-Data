## Making a Word Cloud with TXT Files

## 1. Get the text into a TXT file
## Copy and paste the body of the text into Text Editor
## Click the Format tab and "Make Plain Text"
## Ensure the file looks correct, then save as .txt


## 2. Open up R Studio and prepare it for looking at the text

setwd("~/Desktop/School/ROCCA")
library(tm)
library(SnowballC)
library(wordcloud)


## 3. Make R read the text you want to use


res <- "Chattanoogan2015.txt"
myres <- readLines(res)
resettle <- Corpus(VectorSource(myres))


## 4. Prepare the text by eliminating unnecessary elements

resettle_prep <- tm_map(resettle, tolower)
resettle_prep <- tm_map(resettle_prep, stripWhitespace)
resettle_prep <- tm_map(resettle_prep, removePunctuation)
resettle_prep <- tm_map(resettle_prep, removeNumbers)


## 5. Get rid of stop words and stem the remaining words

resettle_prep <- tm_map(resettle_prep, removeWords, stopwords("english"))
corpus <- tm_map(resettle_prep, stemDocument)


## 6. Examine the corpus you have created

corpus
corpus[[1]]
content(corpus)


## 7. Make the corpus into a Document Term Matrix

dtm <- DocumentTermMatrix(corpus)
dtm
inspect(dtm[1, 1:10])
dtm.mat <- as.matrix(dtm)


## 8. Create your word cloud

wordcloud(colnames(dtm.mat), dtm.mat[1,], max.words = 20)


## 9. If you want to see what stems stand for

stemCompletion("secur", resettle_prep)


## 10. If you want to make the wordcloud a different shape/color (thanks Joy!!!)

wordcloud(colnames(dtm.mat), dtm.mat [1,], size = 0.8, shape = 'circle',rotateRatio = 0.5, minSize = 1, min.freq = 2, scale=c(5, .2), random.order = FALSE, random.color = FALSE, colors= c("pink1","pink2","pink3","pink"))

## I like how this version below looks! The above is a simple start

wordcloud(colnames(dtm.mat), dtm.mat [1,], size = 0.8, shape = 'circle',rotateRatio = 0.5, minSize = 2, min.freq = 3, scale=c(5, .1), random.order = FALSE, random.color = FALSE, colors= c("rosybrown2","darkgoldenrod1","chocolate2","sienna3"))

