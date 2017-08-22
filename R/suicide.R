#' Let a process kill itself
#'
#' @name suicide
#' @docType package
NULL

#' @param interval number of seconds to sleep
#' @export
#' @rdname suicide
suicide <- function(interval) {
  PID <- Sys.getpid()
  cmd <- sprintf('(sleep %s && kill -9 %s)&', interval, PID)
  system(cmd)
}
