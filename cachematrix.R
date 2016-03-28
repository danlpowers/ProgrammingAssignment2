## Functions to manage inverting a matrix and caching the results

## Return object with methods to save and retrieve a matrix and to
## handle creation and cache management of its inverse
makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    # set a new matrix to be inverted
    set <- function(mx = matrix()) {
        x <<- mx
        m <<- NULL
    }
    get <- function() {
        x
    }
    getinverse <- function(x) {
        m
    }
    setinverse <- function(x) {
        m <<- x
    }
    list(get = get,
         set = set,
	 setinverse = setinverse,
	 getinverse = getinverse)
}


## Retrieve an inverted matrix from the passed object's 
## cache or, if none previously saved, invoke the object's
## methods to create an inverse and cache it
## method
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
    message("getting inverted data")
    return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
