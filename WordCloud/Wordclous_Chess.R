library ("NLP")
library ("tm")
library ("SnowballC")
library ("RColorBrewer")
library ("ggplot2")
library ("rattle")
library ("wordcloud")

#Get the working directory
getwd()

# My file is saved locally under "Users/ashishpowani/Documents/R ProjectSpace/Sprints/WordCloudN/Chess.txt" on my machine
# Have only one file in this path
cname<-file.path("/Users/ashishpowani/Documents/R ProjectSpace/Sprints/WordCloudN/")

#cname <-read.table(file.choose(),sep=",",na.strings = "")

# In this case, I am using only one file. 
# To use multiple files,  we would have to modify the code to remove the [[1]]
docs <-Corpus(DirSource(cname))
summary(docs)

# Remove trouble characters by gsub - Used to perform replacement of the first and all matches
docs[[1]] <-gsub("/", " ", docs[[1]])
docs[[1]] <-gsub("@", " ", docs[[1]])
docs[[1]] <-gsub("\\|", " ", docs[[1]])
docs[[1]] <-gsub("\\n", " ", docs[[1]])

# Remove numbers, punctuation, and particular words that don't seem to fit
docs[[1]] <-removeNumbers(docs[[1]])
docs[[1]] <-removePunctuation(docs[[1]])
docs[[1]] <-removeWords(docs[[1]], "Repeated Junk")

# Remove stopwords, such as a, is, an, ...
docs[[1]] <-removeWords(docs[[1]], stopwords("english"))
docs[[1]] <-stripWhitespace(docs[[1]])

# Create the wordcloud
docs <- tm_map(docs,PlainTextDocument)
dtm<- TermDocumentMatrix(docs)
freq<- as.matrix(dtm)
wordcloud(findFreqTerms(dtm), freq, min.freq = 5, colors = brewer.pal(8,"Dark2"))
