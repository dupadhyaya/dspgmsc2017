# Sort Order Rank
set.seed(1123)
marks = ceiling(runif(11,5,10))
marks

# sort
sort(marks)

sort(marks, decreasing = TRUE)

# order
order(marks) # indices
marks[order(marks)]  # similar to sort(x)

order(marks, decreasing = T)
marks[5] = NA
marks
order(marks)
order(marks, na.last = NA)
length(marks)
mean(marks, na.rm=T)
order(marks, na.last = FALSE)   # ??


# rank handles tied values
sort(marks)
#[1]  6  6  7  8  8  9  9 10 10 10 10
#     1  2  3  4  5  6  7  8  8  9 10  
rank(marks)
table(marks)
marks
rank(marks, ties.method='first') # 2-6s - 1,2
rank(marks, ties.method='average')  # default 2-6's - 5
rank(marks, ties.method='max')  # 2 6's - 7
rank(marks, ties.method='random')
table(marks)
marks

marks[4] = NA
marks

sort(marks)  #NA value missing
length(marks)
marks

sort(marks, na.last=TRUE)  # NA last
sort(marks, na.last=FALSE)  # NA first
sort(marks, na.last='keep')  # Nothing . not shown

rank(marks, na.last=TRUE)  # No effect
rank(marks, na.last=FALSE)  # No effect
rank(marks, na.last='keep')  # NA shown

