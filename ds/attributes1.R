# attributes
#
?attributes
# attributes(obj)
# attributes(obj) <- value
# mostattributes(obj) <- value

x = c(1:10)
attributes(x)
attr(x,'batch') = 2017
attributes(x)
mostattributes(x)<- list(mynames=letters[1:10])
x
mostattributes(x)<- list(names=letters[1:10])
x
mostattributes(x)<- list(row.names=letters[1:10])
x
mostattributes(x) = list(dim=1)
x
#mostattributes(x) = list(dim=2)
class(x)
attributes(x)
attr(x,'mode')
attr(x,'what')
attr(x,'class') = 'integer'
attr(x,'class')
class(x)

typeof(x)
df = data.frame(x=matrix())
