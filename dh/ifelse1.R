#if else
as.numeric(TRUE)

as.numeric(FALSE)
1==1
1< 1

toCheck = 1
if ( toCheck ==1) 
{ 
  print("hello")
}
tocheck=2
tocheck
check.bool <- function(x)
{if ( x ==1) 
  { 
    print("hello")
  } else
  { 
    print("No is not 1")
  }
}
check.bool(1)
check.bool(0)



# ifelse

ifelse(1 == 1, 'Yes', 'No')


# Compound Test
#
a = c(1,1,0,1)
b = c(2,1,0,1)
ifelse( a== 1 & b == 1, 'Yes', 'No')
# check each element of a with corr element of b
ifelse( a== 1 && b == 1, 'Yes', 'No')
# only first element checked