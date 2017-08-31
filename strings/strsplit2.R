# String Split

#https://stackoverflow.com/questions/26489276/separate-name-into-firstname-and-lastname-columns-of-data-frame

sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')

firstname = sapply(strsplit(sname, ' '), function(x) x[1])
firstname 

lastname = sapply(strsplit(sname, ' '), function(x) x[length(x)])
lastname


#Method2
ll = strsplit(sname, ' ')

(firstname = sapply(ll, function(x) x[1]))
(lastname = sapply(ll, function(x) x[length(x)]))
