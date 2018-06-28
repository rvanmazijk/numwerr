#' Implement error propagation rules depending on operation supplied
#'
#' @param operation One of the four standard arithmetic operations (+, -, * or /)
#'
#' @return A function
#'
#' @examples
mathwerr <- function(operation = c("+", "-", "*", "/")) {
  if (operation %in% c("+", "-")) {
    return(function(x, y) {
      stopifnot(is.numwerr(x) | is.numwerr(y))
      if (is.numeric(x)) x <- as.numwerr(x)
      if (is.numeric(y)) y <- as.numwerr(y)
      val = eval(parse(text =
        as.character(paste("x$val", operation, "y$val"))
      ))
      err = sqrt(x$err^2 + y$err^2)
      numwerr(val, err)
    })
  } else if (operation %in% c("*", "/")) {
    return(function(x, y) {
      stopifnot(is.numwerr(x) | is.numwerr(y))
      if (is.numwerr(x) & is.numwerr(y)) {
        val <- eval(parse(text =
          as.character(paste("x$val", operation, "y$val"))
        ))
        err <- val * sqrt((x$err / x$val)^2 + (y$err / y$val)^2)
      } else if ((is.numwerr(x) & is.numeric(y)) |
                 (is.numeric(x) & is.numwerr(y))) {
        x_numwerr <- if (is.numwerr(x)) x else y
        y_numeric <- if (is.numeric(y)) y else x
        val <- eval(parse(text =
          as.character(paste("x_numwerr$val", operation, "y_numeric"))
        ))
        err <- val * (x_numwerr$err / x_numwerr$val)
      }
      numwerr(val, err)
    })
  }
}

# Generate arithmetic functions
`%+?%` <- mathwerr("+")
`%-?%` <- mathwerr("-")
`%*?%` <- mathwerr("*")
`%/?%` <- mathwerr("/")
