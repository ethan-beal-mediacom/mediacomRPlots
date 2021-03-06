% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colours.R
\name{mcom_pal}
\alias{mcom_pal}
\title{Return colour list to interpolate a mediacom color palette}
\usage{
mcom_pal(palette = "main", n = pal_len(palette), reverse = FALSE, ...)
}
\arguments{
\item{palette}{Character name of palette in mcom_palettes}

\item{n}{Numeric value indicating number of colours. To use whole palette
input the number of colours in palette. If n > number of colours
in palette then more colours are interpolated.}

\item{reverse}{Boolean indicating whether the palette should be reversed}

\item{...}{Additional arguments to pass to colorRampPalette()}
}
\value{
\code{list} of hex codes
}
\description{
Return colour list to interpolate a mediacom color palette
}
\examples{
mcom_pal("secondary", n = 3) # get first 3 cols in palette
mcom_pal("secondary", n = 6) # get all cols
mcom_pal("secondary", n = 8) #interpolate more cols than palette

ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour=as.factor(cyl))) +
  ggplot2::geom_point() +
  ggplot2::scale_colour_manual(values=mcom_pal())

}
