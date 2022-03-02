#' Re-skins a ggplot2 chart with MediaCom titles and axes
#' @param title Chart title
#' @param subtitle Chart subtitle
#' @param xtitle X axis label
#' @param ytitle Y axis label
#' @param source Data source to display in bottom right
#' @param legend A character. Do you want a legend displayed ["yes"] or ["no"]
#' @param palette A character. Which palette would you like to use. default is
#'                ["none"], so to add a mediacom palette add either ["main"] ,
#'                ["large"] , ["secondary"] or ["grays"].
#' @param palette_len numeric. Change if you want to use more or less colours
#'                    than the number in the palette.
#' @return \code{list} of ggplot2 formatting options
#' @examples
#'
#' # basic scatter plot
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(cyl))) +
#'  ggplot2::geom_point() +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source")
#'
#' # change palette with palette, and change palette length with palette_length
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(cyl))) +
#'  ggplot2::geom_point() +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis",
#'             source = "My Source", palette_name = "secondary", palette_len = 3)
#'
#' # remove axis with legend = "no"
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(gear))) +
#'  ggplot2::geom_point() +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis",
#'             ytitle = "Y Axis", source = "My Source", legend = "no")
#'
#' @export
theme_mcom <- function(title = ggplot2::element_blank(),
                       subtitle = ggplot2::element_blank(),
                       xtitle = ggplot2::element_blank(),
                       ytitle = ggplot2::element_blank(),
                       source = "MediaCom",
                       legend = "yes",
                       palette = "none",
                       palette_length = pal_len(palette),
                       scale_discrete = TRUE){

  formatting <- list(

    # title
    ggplot2::ggtitle(title, subtitle),

    # labs
    ggplot2::labs(x = xtitle,
         y = ytitle,
         caption = paste0("source: ", source)),

    # theme
    ggplot2::theme(
      panel.background = ggplot2::element_blank(),
      legend.position = ifelse(legend == "no", "none", "top"),
      legend.title = ggplot2::element_blank(),
      legend.justification = "left",
      legend.key.size = ggplot2::unit(2, "cm"),
      legend.key= ggplot2::element_blank(),
      legend.background= ggplot2::element_blank(),
      plot.subtitle =  ggplot2::element_text(margin = ggplot2::margin(0,0,20,0)),
      axis.title = ggplot2::element_text(hjust = 0.5),
      axis.ticks = ggplot2::element_blank(),
      text = ggplot2::element_text(colour = mcom_cols("space gray")),
      axis.text = ggplot2::element_text(colour = mcom_cols("space gray")),
      axis.title.x = ggplot2::element_text(margin = ggplot2::margin(10,0,0,0), size = 9),
      axis.title.y = ggplot2::element_text(margin = ggplot2::margin(0,10,0,0), size = 9),
      plot.caption = ggplot2::element_text(margin = ggplot2::margin(10,0,0,0), colour =mcom_cols("dove gray"), size = 8),

    ),
    if (palette != "none"){
      list(
        scale_color_mcom(palette = palette, n = palette_length, discrete = scale_discrete),
        scale_fill_mcom(palette = palette, n = palette_length, discrete = scale_discrete)
      )
      }

  )

  return(formatting)
}
