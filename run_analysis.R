# load Test and Train data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="")

# load features names
names <- read.table("./UCI HAR Dataset/features.txt", sep="")
# adjust names
names$V2 <- tolower(names$V2)             ## convert to lower case
names$V2 <- gsub("\\(\\)", "", names$V2)  ## remove () together
names$V2 <- gsub("-", "", names$V2)       ## remove -
names$V2 <- gsub(",", "", names$V2)       ## remove ,
names$V2 <- gsub("\\(|\\)", "", names$V2) ## remove ( and )

# catch the second column because the first is the index and I don't need this
names <- names[, 2]

# load activity names 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="") 

# correctly name the columns of the data
names(xTrain) <- names
names(xTest) <- names

# merge Test and Train
xMatrix <- rbind(xTest, xTrain)
yVector <- rbind(yTest, yTrain)

# locate variables equal means 
vmeans = grep("[m]ean", names)

# correspondingly update xMatrix
xMatrixReduced = xMatrix[, vmeans]

# create a txt with result of matrix reduced
write.csv(xMatrixReduced, file = "./xMatrixCut.txt", sep="")

yVectorLabels <- vector(mode = "character", length = length(yVector))

# for each activity label, put in a factor variable with the name of the activity
for(a in 1:6) {
        inds <- which(yVector == a)
        yVectorLabels[inds] <- as.character(activityLabels[a, 2])
}

# load subjects
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")

# renaming IDs to more appropriate 
# first create a function to add the word "Subject" to the number ID
assignSubject = function(x) { return(paste("Subject", as.character(x), sep="")) }
# apply sapply function to every element 
namesTestSubject <- sapply(testSubject, FUN = assignSubject)
namesTrainSubject <- sapply(trainSubject, FUN = assignSubject)

# merge the test and train subject names
subjectNamesVector <- rbind(namesTrainSubject, namesTestSubject)

# create a second dataset to means of each variable for each subject
news <- matrix(ncol=length(names(xMatrixReduced)), nrow=length(unique(subjectNamesVector)))
rownames(news) <- unique(subjectNamesVector) 
colnames(news) <- names(xMatrixReduced)

# for each subject calculate the mean of all variables
for(s in unique(subjectNamesVector)){
        w <- which(subjectNamesVector == s)
        cm <- colMeans(xMatrixReduced[w, ])
        news[s,] <- cm
}

# create a txt with final result
write.csv(news, file = "./news.txt", sep="")
