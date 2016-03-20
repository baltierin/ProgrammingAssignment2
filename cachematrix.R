## The functions below allow a cache to be searched before performing the operation in R for a matrix.

## The first function creates the cache from the data in the matrix

makeCacheMatrix<-function(x=matrix()){
	inv<-NULL
	set<-function(y){
		x<<-y
		inv<<-NULL
	}
	get<-function()x
	setinverse<-function(solve)inv<<-solve
	getinverse<-function()inv
	list(set=set, get=get,
		setinverse=setinverse,
		getinverse=getinverse)
		}





## The second function searches the cache for any data that has already been created as an inverse in the matrix before returning a matrix that is the inverse of 'x'.

cacheSolve<-function(x,...){
	inv<-x$getinverse()
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	data<-x$get()
	inv<-solve(data,...)
	x$setinverse(inv)
	inv
	}
