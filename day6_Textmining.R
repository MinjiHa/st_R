#�ؽ�Ʈ �м�

c(1:6,'a') #����
list(1:6,'a') #����Ʈ

o1<-1:4
o2<-6:10
o3<-list(o1,o2)
myo <- list(o1,o2,o3)
myo

# ����Ʈ : [[]], ����:[]
myo[[3]][1] # []: ����Ʈ���� ����Ʈ�� ����
myo[[3]][[1]] #[[]]:����Ʈ ���� ����Ʈ�� ���� ���͸� ����
myo[3]
myo[[3]]
myo[[3]][[2]][4]

mylist<-list(1:6,'a')
mylist
myvector<-c(1:6,'a')
myvector
unlist(mylist)
unlist(mylist) == myvector
mean(unlist(mylist)[1:6])

mylist[[1]]
mean(mylist[[1]][1:6])
n1<-"Donald"
ms<-" "
n2<-"Trump"
list(n1,ms,n2)
unlist(list(n1,ms,n2)) # unlist �Լ��� ���� ����Ʈ�� �����Ǹ鼭 ���ͷ� �ٲ��.

n<-c("��","��","��","��")
gen<-c(2,1,1,2)
df<-data.frame(n,gen)
df

# attribute : �Ӽ��� ���� �̸��� �ְڴ�.
attr(df$n, "means") <- "�̸�"
attr(df$gen, "means") <- "����"
df$n

myvalues <- gen
length(gen)
for (i in 1:length(gen)){
  myvalues[i]<-ifelse(gen[i]==1,"����","����")
}
myvalues
attr(df$gen,"means") #means : �Ӽ���, "����":�Ӽ���

mylist <- list(1:4,6:10,list(1:4,6:10))
mean(mylist[[1]]) # ���Ϳ� ���� ���
lapply(mylist[1], mean) #list�� ���� ���

rep(1,4) #1�� 4�� �ݺ���

s1 <- c("earth","to","earth")
rep(1,length(s1))#1�� 3�� �ݺ���
rep(s1,2)

letters[1:26] #���ĺ� 1������ 26������ ���
letters #���ĺ� �ҹ���
LETTERS #���ĺ� �빮��
tolower("Eye for eye")
toupper("Eye for eye")
nchar("Korea") #���������
nchar("Korea", type = 'bytes')
nchar("�ѱ�")
nchar("�ѱ�", type = 'bytes')
sent <- "Learning R is so interesting"
mywords <- strsplit(sent,split = " ")

mywords[[1]][5]
strsplit(mywords[[1]][5], split = "")

sent2<-"�����ںҿ�ȣ���� ȣ���ںҿ�������"
strsplit(sent2, split=" ")
strsplit(strsplit(sent2, split=" ")[[1]][2], split="")

rep(NA,5) #na�� 5�� ����ִ� ���� ����
myletters<-list(rep(NA,5)) #���͸� ����Ʈ��


myletters[1]<-strsplit(mywords[[1]][1],split = "")
myletters

for (i in 1:5){
  myletters[i]<-strsplit(mywords[[1]][i],split = "")
}

#���ڸ� ���� �ܾ�� ���� : paste
paste(myletters[[1]],collapse = "")
paste(myletters[[1]],collapse = "&")

for (i in 1:5){
  print(myletters[[i]])
}

for (i in 1:5){
  print(paste(myletters[[i]],collapse = ""))
}

mywords2<-rep(NA,5)
for (i in 1:5){
  mywords2[i] <- (paste(myletters[[i]],collapse = ""))
}
mywords2

mywords3<-list(rep(NA,5))
for (i in 1:5){
  mywords3[i] <- (paste(myletters[[i]],collapse = ""))
}
mywords3

paste(mywords2,collapse=" ")
paste(mywords3,collapse=" ")

rwiki <- "R is a programming language and free software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing.
The R language is widely used among statisticians and data miners for developing statistical software and data analysis.
Polls, data mining surveys, and studies of scholarly literature databases show substantial increases in popularity; as of June 2020, R ranks 9th in the TIOBE index, a measure of popularity of programming languages."
rwikiPara = strsplit(rwiki,split = "\n") #\n : ���ܴ����� ������.

for (i in 1:3){
  print(strsplit(rwikiPara[[1]][i],split = " "))
}

#����ǥ���� : regexpr() 1���� �˻� / gregexpr() ���ΰ˻�
sent
regexpr("ing",sent) #����ǥ���� : ing ������ ã�´�.
loc.begin <- as.vector(regexpr("ing",sent))
loc.length<-attr(regexpr("ing",sent),'match.length') #�� ������ �����ϴ� ���ڿ��� ���̰� �󸶳�
loc.end <- loc.begin + loc.length -1
loc.end

gregexpr("ing",sent)

length(gregexpr("ing",sent)[[1]]) #ing ������ ��� ��Ī�Ǿ�����
regexpr("interestin(g)",sent)
regexpr("so (interestin(g))",sent)
regexec("interestin(g)",sent)
regexec("so (interestin(g))",sent)

#�ҹ��� ing�� ING�� �ٲٱ�
sub("ing",'ING',sent) #�ϳ��� �ٲ�
gsub("ing",'ING',sent) #���� �ٲ�

# �������� ó�� : ���� �ܾ�� ����� ���� -> _�� ���� ��ȣ�� ���� : �ڿ��� ��ó�� �ʼ��۾�
# singer = "������ �̸�" �̶�� ���� ��
gsub("Micheal Jackon", "Micheal_Jackon", singer) #�������� ó�� ����

rwikiPsplit = list(rep(NA,3))
for (i in 1:3){
  rwikiPsplit <- strsplit(rwikiPara[[1]][i],split = " ")
}

sent1<-rwikiPsplit[[1]]

sum(table(sent1))
gsub("of","",sent1)
dropSent<-gsub("as|in|the","",sent1)
strsplit(dropSent,split="")

sent <- c("Learning R is so interesting",
          "He is a fascinating singer")

#ing�� ������ ��� �ܾ�
mypat0 <- gregexpr("ing",sent)
regmatches(sent,mypat0)

mypat1 <- gregexpr("[[:alpha:]]ing",sent)
regmatches(sent,mypat1)

mypat1 <- gregexpr("[[:alpha:]](ing)",sent)
regmatches(sent,mypat1)

mypat1 <- gregexpr("[[:upper:]]",sent)
regmatches(sent,mypat1) #�빮���ΰ͵鸸 ���´�

mypat1 <- gregexpr("[[:lower:]]",sent)
regmatches(sent,mypat1) #�ҹ����ΰ͵鸸 ���´�

unlist(regmatches(sent,mypat1)) #����ȭ
mytable <- table(unlist(regmatches(sent,mypat1))) #���� ������Դ°�

max(mytable)
length(mytable)
sum(mytable)

#���۽�(corpus,����ġ)
# �м� ��� �о߿��� ���Ǵ� ��� ����
# ex) �ΰ����ɺо� ���۽� : �ӽŷ���, ���̽�, ��...

# �ڿ���ó�� : ���۽�����
# ����о� ���۽� : ����, ��, ���, ... , ����(x)

mytext <- c("software environment",
            "software  environment",
            "software\tenvironment")
# install.packages("stringr")
# library(stringr)
# strsplit {base}
# str_split {stringr}

str_split(mytext," ")

#� ���ڿ��� �ٸ� ���ڿ��� ġȯ
str_replace_all(mytext, "[[:space:]]{1,}"," ")#�տ� �ִ� ���ڰ� �Ѱ��̻� �����Ѵٸ� ġȯ�ض�.
mytext.nowhitespace <- str_replace_all(mytext, "[[:space:]]{1,}"," ")
mytext2<-"The 45th President of the United States, 
Donald Trump, states that he knows how to play trump with the former president"

str_extract_all(mytext2, boundary("word")) # boundary("word") : �ܾ������ �����ϰ� ����
myword <- unlist(str_extract_all(mytext2, boundary("word")))
table(myword)

#��������ó�� (ö�ڸ� ���� �ܾ�� ���������ʰ�)
myword <- str_replace(myword, "Trump","Trump_unique_") 
myword <- str_replace(myword, "States","States_unique_")
table(tolower(myword))

#���ڰ� ���ڸ� �̻�+������ ���ڸ��̻��϶� "_number_" �� ġȯ
mytext <- c("R is the No. 1 stat sw")
str_replace_all(mytext,"[[:digit:]]{1,}[[:space:]]{1,}","_number_")

####################################################################

# �ؽ�Ʈ���̴� ��Ű��
# install.packages("tm")
# library(tm)

stopwords("en")
stopwords("SMART")

#am, are, is, was were => be�� ġȯ : ����
mytext <- c("I am a boy. You are a boy. The person might be a boy. Is Jane a boy?")
str_replace_all(mytext, "am|are|is|was|were" ,replacement = "be")


# VCorpus : ������ �ִ� ��� �ؽ�Ʈ �����͵��� ����ġ�� ����
my.text.location <- "d:/Rwork/dataR/papers"
mypaper <- VCorpus(DirSource(my.text.location))
summary(mypaper)

mypaper[[2]] # 2��° ����
mypaper[[2]]$content # �������� ���� ����
mypaper[[2]]$meta # ��Ÿ������ ���

# ��ȭ��ȣ : ������, ����('��'�Է�):��Ÿ������
# [[:alnum:]] : ����+����
# [[:punct:]] : Ư����ȣ
# [[:space:]] : ����
meta(mypaper[[2]],tag="author") <- "G. D. Hong"
myfunc <- function(x){
  str_extract_all(x$content,"[[:alnum:]]{1,}[[:punct:]]{1}[[:alnum:]]{1,}")
}
lapply(mypaper, myfunc)

# �빮�� [[:upper:]]�� �����ϴ� �ܾ�(����+����)�� ����
myfunc <- function(x){
  str_extract_all(x$content,"[[:upper:]]{1,}[[:alnum:]]{1,}")
}
lapply(mypaper, myfunc)

# removeNumbers : ���ڸ� ��� ����
mycorpus <- tm_map(mypaper,removeNumbers)
mypaper[[1]]$content #������
mycorpus[[1]]$content #������

# removePunctuation : Ư�����ڸ� ��� ����
mycorpus <- tm_map(mypaper,removePunctuation)
mypaper[[1]]$content #������
mycorpus[[1]]$content #������

# stripWhitespace : ���ʿ��� ������ ��� ����
mycorpus <- tm_map(mycorpus,stripWhitespace)
mypaper[[1]]$content #������
mycorpus[[1]]$content #������

# ��ūȭ : ���۽��� ��ū ������ ������ �۾�
# ������ ����ȭ��?
#   ���� : ���ʿ��� �κ� ����
#   ����ȭ :  �ǹ̰� ���� �پ��� �ܾ���� �ϳ��� �ܾ�� ����

