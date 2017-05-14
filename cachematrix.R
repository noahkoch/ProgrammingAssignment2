# Example for running:

# my_matrix <- matrix(1:4, 2, 2)
# my_cache_matrix <- makeCacheMatrix(my_matrix)
# cacheSolve(my_cache_matrix)

# Manages the setting and getting of the matricies in the cache
# The first time this gets run you will need to set 'x'

makeCacheMatrix <- function(originalmatrix = matrix()) {
  # On first execution we want to set the inversed matrix to null
  inversedmatrix <- NULL

  set <- function(y){
    originalmatrix <<- y 
    # Whenever the matrix is set we will want to set the inverse to be null, also
    inversedmatrix <<- NULL
  }

  get <- function(){
    originalmatrix
  }

  setinverse <- function(inverse){
    inversedmatrix <<- inverse 
  }

  getinverse <- function(){
    inversedmatrix
  }

  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# Returns the cache of inversed matrix if the matrix has already been solved
# Otherwise, run the calculation

cacheSolve <- function(cachematrixobject, ...) {
  m <- cachematrixobject$getinverse()

  if(!is.null(m)){
    message("Grabbing the inverse from cache...")

    # We have the inverse, so break execution
    return(m)
  }

  data <- cachematrixobject$get()
  m <- solve(data, ...)
  cachematrixobject$setinverse(m)
  m
}
