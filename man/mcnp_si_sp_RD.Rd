% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcnp_si_sp_RD.R
\name{mcnp_si_sp_RD}
\alias{mcnp_si_sp_RD}
\title{Produce MCNP source terms from ICRP 107 data except beta}
\usage{
mcnp_si_sp_RD(
  desired_RN,
  rad_type = NULL,
  photon = FALSE,
  cut = 0.001,
  erg.dist = 1,
  my_dir = NULL,
  write_permit = "n"
)
}
\arguments{
\item{desired_RN}{Radionuclide in form "Ba-137m"}

\item{rad_type}{Radiation type, leave NULL if selecting photons or
select from:
'X' for X-Ray
'G' for Gamma
'AE' for Auger Electron
'IE' for Internal Conversion Electron
'A' for Alpha
'AR' for Alpha Recoil
'B-' for Beta Negative
'AQ' for Annihilation Quanta
'B+' for Beta Positive
'PG' for Prompt Gamma
'DG' for Delayed Gamma
'DB' for Delayed Beta
'FF' for Fission Fragment
'N' for Neutron}

\item{photon}{'Y' to select all rad_types that are photons}

\item{cut}{minimum energy, defaults to 1e-3 MeV}

\item{erg.dist}{energy distribution number for MCNP input}

\item{my_dir}{Optional directory. The function will write an output text file, si_sp.txt to the working directory by default.}

\item{write_permit}{Set this to 'y' to allow writing output to your directory.}
}
\value{
a data frame can be saved to memory if desired (i.e. by my_file <- mcnp_si_sp_RD(...)).
For use with MCNP, a text file, 'si_sp.txt' is written to working directory.
If file already exists, it is appended. The file contains all
emission energies in the si 'card' and the Line indicator, L is included,
e.g. si1  L  0.01 (showing a first energy of 0.01 MeV).
This is followed by the emission probability of each si entry.
An additional text entry is made summing up the probabilities.
}
\description{
#' \ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}:
This function is deprecated
and will be removed in a future package revision.
For now, it is still usable.
The replacement, \code{mcnp_sdef_erg_line} is the same function,
renamed to be consistent with the name of function
\code{mcnp_sdef_erg_hist}.
}
\examples{
\dontrun{
mcnp_si_sp_RD("Co-60", photon = TRUE, cut = 0.01, erg.dist = 13)
mcnp_si_sp_RD("Sr-90", rad_type = "B-", cut = 0.01, erg.dist = 15)
mcnp_si_sp_RD("Am-241", rad_type = "A", cut = 0.01, erg.dist = 23)
}
}
\seealso{
\code{\link[=mcnp_sdef_erg_hist]{mcnp_sdef_erg_hist()}} if radioactive emission data is available in histogram form and needs formatting for MCNP input.

Other mcnp tools: 
\code{\link{mcnp_cone_angle}()},
\code{\link{mcnp_est_nps}()},
\code{\link{mcnp_matrix_rotations}()},
\code{\link{mcnp_mesh_bins}()},
\code{\link{mcnp_plot_out_spec}()},
\code{\link{mcnp_scan2plot}()},
\code{\link{mcnp_scan_save}()},
\code{\link{mcnp_sdef_erg_hist}()},
\code{\link{mcnp_sdef_erg_line}()},
\code{\link{mcnp_si_sp_hist_scan}()},
\code{\link{mcnp_si_sp_hist}()}
}
\concept{mcnp tools}
