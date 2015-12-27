## makeCacheMatrix and cacheSolve work as a pair to cache 
## the inverse of a given matrix, x. 
## It returns a list of functions that 
## set and get the matrix
## and set and get the inverse of the matrix

## This function creates a special matrix 
## object that can cache its inverse. 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  set <- function(y) {
    #save matrix to different environment
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setInverse <- function(m_inverse) m <<- m_inverse
  getInverse <- function() m
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function creates the inverse of a matrix
## but only if the matrix's inverse is not already 
## cached. It uses the base package's 'solve' function
## to play the actual inverse role. 
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m_inverse <- x$getInverse()
  if(!is.null(m_inverse)){
    message("getting cached data")
    return(m_inverse)
  }
  
  m_data <- x$get()
  inverse <- solve(m_data, ...)
  x$setInverse(m_inverse)
  m_inverse
}