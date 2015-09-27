features = read.table("./Data/features.txt")

train_subject = read.table("./Data/train/subject_train.txt")
train_X = read.table("./Data/train/X_train.txt")
train_y = read.table("./Data/train/y_train.txt")
colnames(train_y) = "Y"

test_subject = read.table("./Data/test/subject_test.txt")
test_X = read.table("./Data/test/X_test.txt")
test_y = read.table("./Data/test/y_test.txt")
colnames(test_y) = "Y"

train = cbind(train_X, train_y)
test = cbind(test_X, test_y)

# In the following two lines, the reference [, ] has to be specified, or the ID variable 
# might turn into a list and therefore give the rbind an error when we try to merge. 
train$ID = train_subject[, 1]
test$ID = test_subject[, 1]

merged = rbind(train, test)
colnames(merged)[1:561] = levels(features$V2)[features$V2]
merged = merged[, grep("mean()|std()|ID", colnames(merged))]

