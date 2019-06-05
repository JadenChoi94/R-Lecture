#정규식
char<-c('apple','Apple','APPLE','banana','grape')
grep('apple', char)

char2<-c('apple','banana')
grep(char2,char)
grep(paste(char2, collapse='|'), char1, value=T)

grep('pp',char)
grep('pp', char, value=T)
grep('^A', char, value=T)
grep('e$', char, value=T)

char2<-c('grape1','apple1','apple','orange','Apple')
grep('ap',char2, value=T)
grep('[1-9]', char2, value=T)#아래와동일
grep('\\d', char2, value=T)
grep('[[:upper:]]', char2, value=T)#아래와동일
grep('[A-Z]', char2, value=T)

char
nchar(char)

paste('choi','jun','hyuk')
paste('choi','jun','hyuk', sep='')
paste('choi','jun','hyuk', sep='/')
paste('I','\'m','hungry')

strsplit('2019/11/08', split='/')
grep('-','010-1234-5678')
regexpr('-','010-1234-5678')
