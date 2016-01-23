

##makeCachematrix acccepts a matrix as an input and loads it in cache by creating a list

makeCacheMatrix <- function(x = matrix()) {
  newmatrix <- NULL
  
  set <- function(y) {
    x <<- y
    newmatrix <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse){ newmatrix <- inverse} 
  getinverse <- function() { newmatrix}
  
  #Create a list with each function and the corresponding name
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## cacheSolve uses the Solve function to inverse a given matrix. It checks if the matrix 
##has already been cached in memory first and returns it, 
##if not it calculates it and rerturns the inverser newmatrix

  
  cacheSolve <- function(x, ...) {
    
    newmatrix <- x$getinverse()
    #check if the inverse matrix already exists in memory
      if(!is.null(newmatrix)){
      message("getting cached data")
      return(newmatrix)
    }
    
        matrix<-x$get()
        newmatrix<-solve(matrix)
        x$setinverse(newmatrix)
        newmatrix
  }
  

