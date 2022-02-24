#' Re-skins a ggplot2 chart with MediaCom titles and axes
#' @param title Chart title
#' @param subtitle Chart subtitle
#' @param xtitle X axis label
#' @param ytitle Y axis label
#' @param source Data source to display in bottom right
#' @return \code{list} of ggplot2 formatting options
#' @examples
#'ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg)) +
#'  ggplot2::geom_line(colour = mcom_signature_Pink()) +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source")
#' @export
theme_mcom <- function(title = element_blank(),
                       subtitle = element_blank(),
                       xtitle = element_blank(),
                       ytitle = element_blank(),
                       source = "MediaCom"){

  formatting <- list(
    ggplot2::ggtitle(title, subtitle),

    ggplot2::labs(x = xtitle,
         y = ytitle,
         caption = paste0("source: ", source)),

    ggplot2::theme(
      panel.background = ggplot2::element_blank(),
      legend.position = "top",
      legend.title = ggplot2::element_blank(),
      legend.justification = "left",
      legend.key.size = ggplot2::unit(2, "cm"),
      legend.key= ggplot2::element_blank(),
      legend.background= ggplot2::element_blank(),
      plot.subtitle =  ggplot2::element_text(margin = ggplot2::margin(0,0,20,0)),
      axis.title = ggplot2::element_text(hjust = 0.5),
      axis.ticks = ggplot2::element_blank(),
      text = ggplot2::element_text(colour = mcom_space_gray()),
      axis.text = ggplot2::element_text(colour = mcom_space_gray()),
      axis.title.x = ggplot2::element_text(margin = ggplot2::margin(10,0,0,0), size = 9),
      axis.title.y = ggplot2::element_text(margin = ggplot2::margin(0,10,0,0), size = 9),
      plot.caption = ggplot2::element_text(margin = ggplot2::margin(10,0,0,0), colour = mcom_dove_gray(), size = 8)
    )
  )

  return(formatting)
}
