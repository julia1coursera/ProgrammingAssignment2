## these two functions allow to cache the inverse of a matrix - then cached result can be looked up if the same inverse is needed again
        
## function to create a special object that can store the cached matrix
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m            
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## function to compute inverse of matrix but retrieve the inverse if it has already been calculated and matrix has not changed
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       m <- x$getinverse()       
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
       # m <- solve(data, ...)
        m <- solve(data)
        x$setinverse(m)
        m

}

