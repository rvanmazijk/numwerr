print.numwerr <- function(x) {
  print(glue::glue("{x$val} +- {x$err}"))
}
c.numwerr <- function(...) {
  list(...)
}
mean.numwerr <- function(...) {
  # TODO
}
