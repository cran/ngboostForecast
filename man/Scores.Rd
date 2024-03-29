% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{Scores}
\alias{Scores}
\title{Select a rule to compare probabilistic predictions to the observed data.}
\usage{
Scores(score = c("LogScore", "CRPS", "CRPScore", "MLE"))
}
\arguments{
\item{score}{A string. can be one of the following:
\itemize{

\item LogScore : Generic class for the log scoring rule.
\item CRPS : Generic class for the continuous ranked probability scoring rule.
\item CRPScore : Generic class for the continuous ranked probability scoring rule.
\item MLE : Generic class for the log scoring rule.
}}
}
\value{
A score class from ngboost.scores
}
\description{
Select a rule to compare probabilistic predictions to the observed data.
A score from ngboost.scores, e.g. LogScore.
}
\author{
Resul Akay
}
