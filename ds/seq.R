# Length Out

#Generate regular sequences. seq is a standard generic with a default method. seq.int is a primitive which can be much faster but has a few restrictions. seq_along 
#and seq_len are very fast primitives for two common cases.

seq(...)

## Default S3 method:
#seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
    length.out = NULL, along.with = NULL, ...)

seq(1, 100)

seq(1,100,2)

#seq.int(from, to, by, length.out, along.with, ...)

seq.int(1, 100, 2)
seq.int(1,100, length.out = 5)
#desired length of the sequence.
seq.int(1,100, length.out = 15)
seq.int(0,100, length.out = 20)

#along.with	 - take the length from the length of this argument.

seq_along(along.with)
seq_len(length.out)


seq(0, 1, length.out = 11)
seq(stats::rnorm(20)) # effectively 'along'
seq(1, 9, by = 2)     # matches 'end'
seq(1, 9, by = pi)    # stays below 'end'
seq(1, 6, by = 3)
seq(1.575, 5.125, by = 0.05)
seq(17) # same as 1:17, or even better seq_len(17)

# abbreviate names
seq(f = 1, b = 5, leng = 10)  # abbreviate key names d b leng
# [1]  1  6 11 16 21 26 31 36 41 46

seq(from = 1, by = 2, length.out = 10)


# by              step size if not specified by from
# length.out      in place of by
# along.with      in place of length.out

(lo = 1:10)
seq(from=30,to= 60,by=4, length.out=lo)

#length.out: If you want to get a total of 10 numbers between 0 and 1
seq(0, 1, length.out = 10)
# gives 10 equally spaced numbers from 0 to 1
x = seq(1,100, length.out=10)
x
diff(x, lag=1)
?diff
(y=1:10)
diff(y, 2)
diff(y, 2, 1)
diff(y, 2, 1)
(y1 = seq(1,100,by=5))
diff(y1)
diff(y1,1)  # y1[2] - y1[1]
diff(y1,2)  # y1[3] - y1[1]
diff(y1,3)  # y1[4] - y1[1]
diff(y1,1,1)
diff(y1,1,2)  # not clear
diff(y1,1,3)  # not Clear



#along.with: It takes the length of the vector you supply as input and provides a vector from 1:length(input).

seq(from=10, to=20, along.with=c(10,20,30))
seq(from=10, to=20, along.with=c(10,20,30,40))


#seq_along: Instead of seq(along.with(.))

seq_along(c(10,20,30,40,50,55))
