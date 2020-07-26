#������ �ҷ�����
teens <- read.csv("snsdata.csv")
View(teens)
# ������ Ȯ��
summary(teens)

# �÷����� ������ ���� Ȯ��
colSums(is.na(teens))

## age �̻�ġ �ذ�
# �̻�ġ NAó��
teens$age <- ifelse( teens$age >= 13 & teens$age < 20 , teens$age, NA)

## age ���������� �ذ�
# NA�� ä���ֱ�( ���� �����⵵ �������� ������� �Է� )

avg_age<-ave(teens$age,teens$gradyear,
             FUN=function(x) mean(x,na.rm=TRUE))
View(avg_age)
teens$age <- ifelse(is.na(teens$age), avg_age, teens$age)

## gender ������ �ذ� - knn

gender_exist <- teens[!is.na(teens$gender),] # gender_exist <- na.omit(teens)
gender_na <- teens[is.na(teens$gender),]
View(gender_na$gender)

# ǥ��ȭ
teens_train<-as.data.frame(scale(gender_exist[,4:40]))
teens_test<-as.data.frame(scale(gender_na[,4:40]))
View(teens_test)

library(class)
# library(caret)
# library(e1071)

genderknn <- knn(train = teens_train,
              test = teens_test,
              cl = gender_exist[,2],
              k = 11)

gender_na$gender <- genderknn
teens_fulldata <- rbind(gender_exist,gender_na)

summary(teens_fulldata)