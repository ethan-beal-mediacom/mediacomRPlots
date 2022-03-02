
#' Color scale constructor for Mediacom colors
#'
#' @param palette Character name of palette
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @examples
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg,
#'                                           colour = as.factor(carb))) +
#'   ggplot2::geom_point() +
#'   # n needs to be the same as number of groups colouring by
#'   scale_color_mcom(palette = "secondary", n = 6) +
#'   theme_mcom()
#'
#'# with a continuos scale
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = wt)) +
#'   ggplot2::geom_point() +
#'   scale_color_mcom(discrete = F)
#'
#' @export
scale_color_mcom <- function(palette = "main", n = pal_len(palette), discrete = TRUE, reverse = FALSE, ...) {
  pal <- mcom_pal_for_scale(palette = palette, reverse = reverse, n = n)

  if (discrete) {
    if (class(pal) == "function"){
      ggplot2::discrete_scale("colour", paste0("mcom_", palette), palette = pal, ...)
    } else { ggplot2::scale_colour_manual(values=c(pal))}
  } else {
      if (class(pal) == "function"){
        ggplot2::scale_color_gradientn(colours = pal(256), ...)
      } else { pal = grDevices::colorRampPalette(pal, ...)
               ggplot2::scale_color_gradientn(colours = pal(256), ...)}
  }

}



#' Fill scale constructor for Mediacom colors
#'
#' @param palette Character name of palette
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @examples
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x= as.factor(cyl), y=mean(mpg),
#'                                           fill = as.factor(gear))) +
#'   ggplot2::geom_col() +
#'   scale_fill_mcom(palette = "secondary", n = 3) +
#'   theme_mcom()

#' @export
scale_fill_mcom <- function(palette = "main", n = pal_len(palette), discrete = TRUE, reverse = FALSE, ...) {
  pal <- mcom_pal_for_scale(palette = palette, reverse = reverse, n = n)

  if (discrete) {
    if (class(pal) == "function"){
      ggplot2::discrete_scale("fill", paste0("mcom_", palette), palette = pal, ...)
    } else { ggplot2::scale_fill_manual(values=c(pal))}
  } else {
    if (class(pal) == "function"){
      ggplot2::scale_fill_gradientn(colours = pal(256), ...)
    } else { pal = grDevices::colorRampPalette(pal, ...)
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)}
  }

}



