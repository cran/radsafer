% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcnp_cone_angle.R
\name{mcnp_cone_angle}
\alias{mcnp_cone_angle}
\title{MCNP Cone Opening Parameter}
\usage{
mcnp_cone_angle(d)
}
\arguments{
\item{d}{The cone angle in degrees.}
}
\value{
tangent of cone angle squared
}
\description{
MCNP cone surface requires a term, t^2, which is the tangent of
the cone angle, in radians, squared. This function takes an input in
degrees and provides the parameter needed by MCNP.
}
\examples{
mcnp_cone_angle(45)
}
\seealso{
Other mcnp tools: 
\code{\link{mcnp_est_nps}()},
\code{\link{mcnp_matrix_rotations}()},
\code{\link{mcnp_mesh_bins}()},
\code{\link{mcnp_plot_out_spec}()},
\code{\link{mcnp_scan2plot}()},
\code{\link{mcnp_scan_save}()},
\code{\link{mcnp_sdef_erg_hist}()},
\code{\link{mcnp_sdef_erg_line}()},
\code{\link{mcnp_si_sp_RD}()},
\code{\link{mcnp_si_sp_hist_scan}()},
\code{\link{mcnp_si_sp_hist}()}
}
\concept{mcnp tools}
