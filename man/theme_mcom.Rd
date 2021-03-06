% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_mcom.R
\name{theme_mcom}
\alias{theme_mcom}
\title{Re-skins a ggplot2 chart with MediaCom titles and axes}
\usage{
theme_mcom(
  title = ggplot2::element_blank(),
  subtitle = ggplot2::element_blank(),
  xtitle = ggplot2::element_blank(),
  ytitle = ggplot2::element_blank(),
  source = "MediaCom",
  legend = "yes",
  palette = "none",
  palette_length = pal_len(palette),
  scale_discrete = TRUE
)
}
\arguments{
\item{title}{Chart title}

\item{subtitle}{Chart subtitle}

\item{xtitle}{X axis label}

\item{ytitle}{Y axis label}

\item{source}{Data source to display in bottom right}

\item{legend}{A character. Do you want a legend displayed ["yes"] or ["no"]}

\item{palette}{A character. Which palette would you like to use. default is
["none"], so to add a mediacom palette add either ["main"] ,
["large"] , ["secondary"] or ["grays"].}

\item{palette_len}{numeric. Change if you want to use more or less colours
than the number in the palette.}
}
\value{
\code{list} of ggplot2 formatting options
}
\description{
Re-skins a ggplot2 chart with MediaCom titles and axes
}
\examples{

# basic scatter plot
ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(cyl))) +
 ggplot2::geom_point() +
 theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source")

# change palette with palette, and change palette length with palette_length
ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(cyl))) +
 ggplot2::geom_point() +
 theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis",
            source = "My Source", palette_name = "secondary", palette_len = 3)

# remove axis with legend = "no"
ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(gear))) +
 ggplot2::geom_point() +
 theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis",
            ytitle = "Y Axis", source = "My Source", legend = "no")

}
