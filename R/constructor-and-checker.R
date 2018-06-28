#' Create a number with error (a "numwerr")
#'
#' @param val A numeric
#' @param err A numeric, specifying the error or uncertainty of `val`
#'
#' @return A numwerr
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
#'
#' @examples
is.numwerr <- function(x) {
  class(x) == "numwerr"
}

assume_zero_error <- function(x) {
  numwerr(x, 0)
}
as.numwerr <- function(x, ...) {
  UseMethod("as.numwerr", x)
}

#' Comvert a numeric to a numwerr by assuming 0 error
#'
#' @param x A numeric
#'
#' @return A numwerr
#'
#' @examples
as.numwerr.numeric <- function(x) {
  assume_zero_error(x)
}