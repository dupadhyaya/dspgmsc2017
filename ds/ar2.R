# 2 coys ; Each coy has 3 depts : Each dept has 4 salesman
schools = c('ds', 'law')
courses = c('graduate','pg', 'diploma')
students = c('S1', 'S2', 'S3', 'S4', 'S5')
set.seed(1234)
(scholarship  = ceiling(runif(2*3*5,1000,2000)))
length(scholarship)
scharray = array(dim= c(5,3,2) , data=scholarship,
                   dimnames = list(students,courses,schools))
scharray

scharray[5,2,1] # Student 5th student of ds - pg course
scharray[1,1,2] # Student 1 of law of law - dip course
scharray[1,,] # average of all scholarship of students : School vs Course
scharray[,,1] # Average of Student vs Courses 

apply(scharray, c(1), sum)  # studentwise sum
apply(scharray, c(2), sum)  # coursewise sum
apply(scharray, c(3), sum) # schoolwise sum
apply(scharray, c(2,3), sum) # Course vs School sum
