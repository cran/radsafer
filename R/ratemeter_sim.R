#' Ratemeter Simulation
#' @description Plot simulated ratemeter readings once per second for 600
#'   seconds. The meter starts with a reading of zero and builds up based on the
#'   time constant. Resolution uncertainty is established to express the
#'   uncertainty from reading an analog scale, including the instability of its
#'   readings. Many standard references identify the precision or resolution
#'   uncertainty of analog readings as half of the smallest increment. This
#'   should be considered the single coverage uncertainty for a very stable
#'   reading. When a reading is not very stable, evaluation of the reading
#'   fluctuation is evaluated in terms of numbers of scale increments covered by
#'   meter indication over a reasonable evaluation period.
#' @param cpm_equilibrium The expected count rate.
#' @param meter_scale_increments The meter scale increments.
#' @param tau equal to the Resistance * Capacitance of the counting circuit.
#'   Units = seconds. Default set to 9.5, which provides 90% equilibrium in 22
#'   seconds. If the user does not know the time constant, but has an estimate
#'   of equilibrium in some time, use tau.estimate.
#' @family rad_measurements
#' @param trials Number of seconds to run simulation. Default = 600.
#' @param log_opt If logarithmic scale is needed, set to "y". If set to anything
#'   but blank (default), scale will be logarithmic.
#' @return Plot of simulated meter reading every second..
#' @examples
#' rate_meter_sim(cpm_equilibrium = 270, meter_scale_increments = seq(100, 1000, 20))
#' rate_meter_sim(cpm_equilibrium = 2.7e5, meter_scale_increments = seq(2e5, 1e6, 2e4))
#' rate_meter_sim(450, seq(20, 1000, 20), trials = 1200, tau = 24.8534)
#' @export
rate_meter_sim <- function(cpm_equilibrium,
                           meter_scale_increments,
                           trials = 600,
                           tau = 9.5,
                           log_opt = "") {
  ifelse(log_opt == "", ylim <- c(cpm_equilibrium * 0.8, cpm_equilibrium * 1.2),
    ylim <- c(cpm_equilibrium * 0.2, cpm_equilibrium * 2)
  )
  cps_cpm_adj <- exp(4.24985 - 1.04087 * log(tau))
  runtime_df <- data.frame(
    "sec" = 1:trials,
    "new_cps" = rep(0, trials),
    "cpm" = rep(0, trials)
  )
  for (j in 2:max(runtime_df$sec)) {
    # first_past <- ifelse(j > 60, j - 60, 1) #use at most last 60 new cps
    runtime_df$new_cps[j] <- stats::rpois(1, cpm_equilibrium / 60) * exp(-1 / tau)
    runtime_df$cpm[j] <- cps_cpm_adj * length(1:j) *
      mean(runtime_df$new_cps[1:j] *
        exp(-(j - (1:j)) / tau))
  }

  fudge <- cpm_equilibrium /
    mean(runtime_df$cpm[0.66 * floor(length(runtime_df$cpm)):
    length(runtime_df$cpm)])
  tcol <- "darkblue"
  # set up plot range and draw cpm_equilibrium line
  graphics::plot(
    x = runtime_df$sec,
    y = runtime_df$cpm,
    col = "blue",
    xlab = "time, s",
    ylab = "cpm",
    col.lab = tcol,
    type = "p",
    ylim = ylim,
    log = log_opt
  )
  graphics::abline(h = meter_scale_increments, col = "gray")
  graphics::abline(h = cpm_equilibrium, col = "lightcoral", lty = 2)
}
