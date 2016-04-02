# load Test and Train data
xTrain <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\train\\X_train.txt", sep="")
yTrain <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\train\\y_train.txt", sep="")
xTest <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\test\\X_test.txt", sep="")
yTest <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\test\\y_test.txt", sep="")

# load features names
names <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\features.txt", sep="")
# catch the second column because the first is the index and I don't need this
names <- names[, 2]
# load activity names 
activityLabels <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\activity_labels.txt", sep="") 

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

# create a csv with result of matrix reduced
write.csv(xMatrixReduced, file = "C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\xMatrixCut.csv", sep="")

yVectorLabels <- vector(mode = "character", length = length(yVector))

# for each activity label, put in a factor variable with the name of the activity
for(a in 1:6) {
        inds <- which(yVector == a)
        yVectorLabels[inds] <- as.character(activityLabels[a, 2])
}

# load subjects
trainSubject <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\train\\subject_train.txt", sep="")
testSubject <- read.table("C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\UCI HAR Dataset\\test\\subject_test.txt", sep="")

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

write.csv(news, file = "C:\\Users\\elvis.endrigo\\Documents\\Conhecimento\\Getting and Cleaning Data\\W4\\Project\\news.csv", sep="")
