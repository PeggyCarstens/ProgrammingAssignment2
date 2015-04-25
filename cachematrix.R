## Put comments here that give an overall description of what your
## functions do

## creates a "matrix" object that can cache its inverse (solve)
## creates 4 functions to get/set the matrix and it's inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## return a matrix that is the inverse of matrix 'x'
## uses functions from the makeCacheMatrix function above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse() #function from above function
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get() #function from above function
  m <- solve(data, ...)
  x$setinverse(m) #function from above function
  m
}
