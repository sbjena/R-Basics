# Matrix

# matrix is a two dimentional vector
# all attribute of fuction can be checked with attribute function attribute()

x <- matrix(1:9,nrow = 3,ncol = 3)
print(x)
class(x)
attributes(x)
dim(x)
# byrow =TRUE  fill matrix row-wise

x <- matrix(1:9,nrow = 3,byrow = TRUE)
print(x) # fill matrix row-wise

# It is possible to provide row and colname using dimnames
x <- matrix(1:9,nrow = 3,dimnames = list(c('X','Y','Z'),c('A','B','C')))
x

# These name can be accessed by colnames() and  rownames()
colnames(x)
rownames(x)

# another way to create a matrix is rbind and cbind
cbind(x,c(10,11,12))
rbind(x,c(10,11,12))

#set dimention to a vector

x <- c(1,2,3,4,5,6,7,8)
dim(x) <- c(2,4)
x

# How to access element of a matrix

x <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,ncol = 3)
x
x[c(1,2),c(2,3)]
x[c(1,2),]
x[c(1:3),]
x[c(-1),] # select all row except first row
x[-1,]

# Modify a matrix 
x <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,ncol = 3)
x[2,2] <- 10  
x
x[x<5] <- 0  
x
x[x[1,] >5] <- 15 
x

#transpose a matrix

t(x)

