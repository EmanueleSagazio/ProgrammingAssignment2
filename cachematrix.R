## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y 
    m <<- NULL 
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

This function creates a list object containing four functions (setter and getter) that act as methods to interact with the internal environment, preserving the state of the array (x) and its cached inverse (m).

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("I'm recovering data from the cache...")
    return(m) 
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}

This function checks the cache for the inverse. If the inverse is already present, it returns it immediately. Otherwise, it computes the inverse using solve(), caches it using setInverse(), and then returns it.
