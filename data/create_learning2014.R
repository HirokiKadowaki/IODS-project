#Hiroki Kadowaki, 9th Nov. 2019.
#RStudio Exercise 2

lrn14 <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep = "\t", header = TRUE)
dim(lrn14)
#183 observations 64 variables
str(lrn14)

lrn14$Attitude
lrn14$Attitude / 10
lrn14$attitude <- lrn14$Attitude / 10

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")
lrn14 <- select(lrn14, one_of(keep_columns))
str(learning2014)
dim(learning2014)
#183 observations 7 variables

lrn14$deep <- lrn14$deep * length(deep_questions)
lrn14$stra <- lrn14$stra * length(strategic_questions)
lrn14$surf <- lrn14$surf * length(surface_questions)
lrn14

lrn14[lrn14 == 0] <- NA
lrn14

data1 <- lrn14[complete.cases(lrn14),]
data1

dim(data1)
#now there is 166 observations and 7 variables


?write.csv
write.csv(data1, file = "learning2014.csv")

