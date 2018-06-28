numwerr <- function(val, err) {
  # TODO: vectorise
  structure(list(val = val, err = err), class = "numwerr")
}
`%?%` <- function(val, err) {
  numwerr(val, err)
}
is.numwerr <- function(x) {
  class(x) == "numwerr"
}
