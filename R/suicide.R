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

#' @export
#' @rdname suicide
batch_suicide <- function(interval) {
  cmd <- sprintf('(sleep %s && aws batch terminate-job --job-id $AWS_BATCH_JOB_ID --reason "Job timed out.")&', interval)
  system(cmd)
}
