#' Create a number with error (a "numwerr")
#'
#' @param val A numeric
#' @param err A numeric, specifying the error or uncertainty of `val`
#'
#' @return A numwerr
#' @export
#'
#' @examples
numwerr <- function(val, err) {
  # TODO: vectorise
  structure(list(val = val, err = err), class = "numwerr")
}

# TODO: link this doc to `numwerr()` doc above
#' Create a number with error (a "numwerr")
#'
#' @param val A numeric
#' @param err A numeric, specifying the error or uncertainty of `val`
#'
#' @return A numwerr
#' @export
#'
#' @examples
`%?%` <- function(val, err) {
  numwerr(val, err)
}

#' Checks if `x` is a numwerr
#'
#' @param x An atomic vector
#'
#' @return A boolean
#' @export
#'
#' @examples
is.numwerr <- function(x) {
  class(x) == "numwerr"
}
