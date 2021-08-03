# two function with subs that cache the inverse of a matrx

# create a special matrix obj. that should cache its inverse
makeCacheMatrix <- function( m = matrix() ) {
        
        invrs <- NULL
        
        set <- function( mx ) {
                m <<- mx
                invrs <<- NULL
        }
        
        #get the value of the mx argument
        get <- function() {
                m
        }
        #assigns val of inv in parent enviro
        setInverse <- function(inverse) {
                invrs <<- inverse
        }
        #retrieve tha val of inverse
        getInv <- function() {
                invrs}
        
        list(set = set, get = get,setInverse = setInverse, getInv = getInv)
}

# get the inverse of the matrix from makeCache fct.
# as in coursera: If the inverse has already been calculated (and the matrix has not changed),
# ...then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        #get a matrix that is the ivnerse of x
        m <- x$getInv()
        
        if( !is.null(m) ) {
                message("get cachd data")
                return(m)}git 
        
        data <- x$get()
        
        #calculating the inverse
        m <- solve(data) %*% data
        
        # setting the inverse
        x$setInverse(m)
        
        m
}