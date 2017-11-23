# Sentimental Analysis - Jaideep

#Load Libraries
library("caTools")
library("tm")
library("RCurl")

#Loading and Preparing Data
#Read Data
test_data_url <- "https://storage.googleapis.com/kaggle-competitions-data/kaggle/2558/testdata.txt?GoogleAccessId=competitions-data@kaggle-161607.iam.gserviceaccount.com&Expires=1511669531&Signature=fRN2%2BLu%2BzmCAMr1hQfo2DRQSOd1642VFfnoIx%2B10vjt711yUEHrc2B6D2exp6EOp%2By1tu46TAMDDr9WCHqU9aIr%2BKtpp4LSPNJ%2BIZtCBdwWebT0kLbIJp5R9npIsKFeMNl1%2B9rkNxQqwJonuZb2fRwueh%2Fxot1jnkF2Qs19008O%2BB6v2l40WzXQTmXL76z9gIi4bjGJNKJOcCaidNwE1CQO1hy5EoZUpiAnTb3ZaAm0gqdmDQu5cnLKyOUBU%2B9nm9zGkDupDif2wDTEQrTcp17RG9v%2Fm7U63BNRxesTF4dNZxWEm5KGkV2osCUlv5fUSTV5ufIrmz3s5I4xuy3g%2BQw%3D%3D"
train_data_url <- "https://storage.googleapis.com/kaggle-competitions-data/kaggle/2558/training.txt?GoogleAccessId=competitions-data@kaggle-161607.iam.gserviceaccount.com&Expires=1511668419&Signature=l856gUpR1h3iEZuPEZAOQ%2BIaU9a2A%2FiKsUgE3RKCuSiYg71lnK%2FR7Svcafplsca47cY0ehkK4JYiQxhneuz%2Bx3I0B3XOfVfUXxNlq9gNFZ5cqVQmfPR0f3DYZnQHc5X3jVjLfG1hVE4xssqJPhbMqzBvabKsNB0pWuCT2bpfFXNqXfoIP0bS2T7SIGyn9dQe%2B8QgvzysBF3bbvWQ1KPFaFdRuBEoLteGuuJQ2PS77%2BxlWfNIyX1kOdwCFEJB%2FpoifiM9RCN2pI3rvn1xyz0SkB%2B6NUsHkJKzcs4hy1JmAvvspb8OLqQC2iVj%2BcayXVQgb7eF8nC4PVE5hNbhbYn54A%3D%3D"
test_data_file <- RCurl::getURL(test_data_url)
train_data_file <- RCurl::getURL(train_data_url)
train_data_df <- read.csv( text = train_data_file, sep='\t', header=FALSE, quote = "", stringsAsFactor=F, col.names=c("Sentiment", "Text"))
test_data_df <- read.csv( text = test_data_file, sep='\t', header=FALSE, quote = "", stringsAsFactor=F, col.names=c("Text"))
train_data_df$Sentiment <- as.factor(train_data_df$Sentiment)

#about data
summary(train_data_df) 
summary(test_data_df)
dim(train_data_df)
dim(test_data_df)
head(train_data_df,n=1)
table(train_data_df$Sentiment)
head(sapply(train_data_df$Text, strsplit, " "),n=2)
(stext=head(sapply( train_data_df$Text,strsplit, " "), n=2))
sapply(stext, length)
mean(sapply(stext, length))
mean(sapply(sapply(train_data_df$Text, strsplit, " "), length))

#Corpus
#Eg1
(input <- c('This is line one.','And this is the second one'))
(vecSource <- VectorSource(input))
(corpus1 = Corpus(vecSource))


corpus <- Corpus(VectorSource(c(train_data_df$Text, test_data_df$Text)))
corpus[1]$content


#transform its contents
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

(dtm <- DocumentTermMatrix(corpus))
(sparse <- removeSparseTerms(dtm, 0.99))

#Convert to DF for use
important_words_df <- as.data.frame(as.matrix(sparse))
head(important_words_df[1:10])
colnames(important_words_df) <- make.names(colnames(important_words_df))
head(important_words_df[1:10])

# split into train and test
important_words_train_df <- head(important_words_df, nrow(train_data_df))
head(important_words_train_df[1:10])

important_words_test_df <- tail(important_words_df, nrow(test_data_df))
head(important_words_test_df[1:10])


# Add to original dataframes
train_data_words_df <- cbind(train_data_df, important_words_train_df)

head(train_data_words_df,n=2)
test_data_words_df <- cbind(test_data_df, important_words_test_df)
head(test_data_words_df,n=2)

# Get rid of the original Text field
train_data_words_df$Text <- NULL
test_data_words_df$Text <- NULL
head(train_data_words_df,n=2)
head(test_data_words_df,n=2)
