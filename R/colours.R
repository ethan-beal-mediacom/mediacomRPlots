#' Function to extract Mediacom colors as hex codes
#'
#' @param ... Character names of mcom_colors
#'
#' @examples
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg)) +
#'   ggplot2::geom_point(colour = mcom_cols("signature pink"))
#'
#' @export
mcom_cols <- function(...) {

  mcom_colors <- c(
    `signature pink` = "#E1005D",
    `white`      = "#FFFFFF",
    `dove gray`       = "#EDF2F4",
    `space gray`     = "#404E5C",
    `midnight`     = "#011627",
    `teal` = "#3FCBB6",
    `orange`  = "#FF9914",
    `grape` = "#8C035C",
    `light pink` = "#F291BF",
    `green` = "#9AD348",
    `blue` = "#2AB0BF",
    `purple` = "#A06EBA")

  cols <- c(...)

  if (is.null(cols))
    return (mcom_colors)

  mcom_colors[cols]
}

#' Return length of given palette
#'
#' @param palette Character name of palette in mcom_palettes
#' @return \code{numeric} number of colours in palette
#'
#' @examples
#' pal_len("main")
#'
#' @export
pal_len <- function(palette){
  mcom_palettes <- list(
    `main`  = mcom_cols("signature pink", "teal", "orange"),
    `secondary` = mcom_cols("orange", "grape", "light pink", "green", "blue", "purple"),
    `grays` = mcom_cols("dove gray", "space gray", "midnight"),
    `large` = mcom_cols("signature pink", "teal", "orange", "grape", "light pink", "green", "purple", "blue")
  )
  length(mcom_palettes[[palette]])
}




#' Return colour list to interpolate a mediacom color palette
#'
#' @param palette Character name of palette in mcom_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param n Numeric value indicating number of colours. To use whole palette
#'          input the number of colours in palette. If n > number of colours
#'          in palette then more colours are interpolated.
#' @param ... Additional arguments to pass to colorRampPalette()
#' @return \code{list} of hex codes
#'
#' @examples
#' mcom_pal("secondary", n = 3) # get first 3 cols in palette
#' mcom_pal("secondary", n = 6) # get all cols
#' mcom_pal("secondary", n = 8) #interpolate more cols than palette
#'
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour=as.factor(cyl))) +
#'   ggplot2::geom_point() +
#'   ggplot2::scale_colour_manual(values=mcom_pal())
#'
#' @export
mcom_pal <- function(palette = "main", n = 3, reverse = FALSE, ...) {

  mcom_palettes <- list(
    `main`  = mcom_cols("signature pink", "teal", "orange"),
    `secondary` = mcom_cols("orange", "grape", "light pink", "green", "blue", "purple"),
    `grays` = mcom_cols("dove gray", "space gray", "midnight"),
    `large` = mcom_cols("signature pink", "teal", "orange", "grape", "light pink", "green", "purple", "blue")
    )

  pal <- mcom_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  if (n > pal_len(palette)){ grDevices::colorRampPalette(pal, ...)(n)
  } else { unname(pal)[1:n] }


}


#' Return function or colour list to interpolate a mediacom color palette
#' For us in scale_fill_mcom or scale_colour_mcom
#'
#' @param palette Character name of palette in mcom_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @param n Numeric value indicating number of colours. To use whole palette
#'          input the number of colours in palette. If n > number of colours
#'          in palette then more colours are interpolated.
#' @return \code{list} of hex codes or
#'         \code{function}
#'
#' @examples
#' mcom_pal_for_scale("secondary", n = 3) # get first 3 cols in palette
#' mcom_pal_for_scale("secondary", n = 6) # get all cols
#' mcom_pal_for_scale("secondary", n = 8)(8) #interpolate more cols than palette
#'
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg,
#'                                           colour=as.factor(cyl))) +
#'   ggplot2::geom_point() +
#'   ggplot2::scale_colour_manual(values=mcom_pal())
#'
#' @export

mcom_pal_for_scale <- function(palette = "main", n = 3, reverse = FALSE, ...) {

  mcom_palettes <- list(
    `main`  = mcom_cols("signature pink", "teal", "orange"),
    `secondary` = mcom_cols("orange", "grape", "light pink", "green", "blue", "purple"),
    `grays` = mcom_cols("dove gray", "space gray", "midnight"),
    `large` = mcom_cols("signature pink", "teal", "orange", "grape", "light pink", "green", "purple", "blue")
  )

  pal <- mcom_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  if (n > pal_len(palette)){ grDevices::colorRampPalette(pal, ...)
  } else { unname(pal) }


}




