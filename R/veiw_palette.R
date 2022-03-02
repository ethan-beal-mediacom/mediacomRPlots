#' Allows you to view all mediacom palettes and names used in mcom_pal or mcom_pal_for_scale
#' @param palette Character name of palette to view. If "all" then all palettes are shown 
#' @param n can spescify number of colours you want to use. if n > palette length then more 
#'          colours are interpolated  
#' @return \code{list} of ggplot2 formatting options
#' @examples
#'
#' # basic scatter plot
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(gear))) +
#'  ggplot2::geom_point() +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source")
#'
#' # change palette with palette, and change palette length with palette_len
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(carb))) +
#'  ggplot2::geom_point() +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source", palette_name = "secondary", palette_len = 6)
#'
#' # remove axis with legend = "no"
#' ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(gear))) +
#'  ggplot2::geom_point() +
#'  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source", legend = "no")
#'
#' @export

view_palette <- function(palette = "all", n = pal_len(palette)){
  
  if (palette == "all" ){
    
    main <- data.frame(col = mcom_pal(palette = "main", n = 3), pal = "main", n =1)
    
    secondary <- data.frame(col = mcom_pal(palette = "secondary", n = 6), pal = "secondary", n =1)
    
    grays <- data.frame(col = mcom_pal(palette = "grays", n = 3), pal = "grays", n =1)
    
    large <- data.frame(col = mcom_pal(palette = "large", n = 8), pal = "large", n =1)
    
    df <- rbind(main, secondary, grays, large) %>% 
      group_by(pal) %>% 
      mutate(y = 1/sum(n),
             col = rev(col)) %>% 
      ungroup() 
    
    df$col <- factor(df$col, levels = unique(df$col))
    df$pal <- factor(df$pal, levels = unique(df$pal))
    
    ggplot2::ggplot(df, ggplot2::aes(x = pal, y = y, fill = col)) +
      ggplot2::geom_bar(stat = "identity", width = 1) +
      ggplot2::geom_text(ggplot2::aes(label = col, size =1), position = ggplot2::position_stack(vjust = .5)) +
      ggplot2::scale_fill_manual(values = c("#E1005D" = "#E1005D",
                                            "#3FCBB6" = "#3FCBB6",
                                            "#FF9914" = "#FF9914",
                                            "#8C035C" = "#8C035C",
                                            "#F291BF" = "#F291BF",
                                            "#9AD348" = "#9AD348",
                                            "#A06EBA" = "#A06EBA",
                                            "#EDF2F4" = "#EDF2F4",
                                            "#404E5C" = "#404E5C",
                                            "#011627" = "#011627",
                                            "#2AB0BF" = "#2AB0BF")) +
      theme_mcom(legend = "no") +
      ggplot2::coord_flip() +
      ggplot2::theme(axis.text.x = ggplot2::element_blank(),
                     axis.text.y = ggplot2::element_text(angle = 45, size = 12, colour = mcom_cols("midnight"))) 
    
  } else {
  
    # display a spesified set of colours
    pal <- mcom_pal(palette = palette, n = n)
    df <- data.frame(col = pal, h = rep(1, each = length(pal)))
    
    ggplot2::ggplot(df, ggplot2::aes(x = col, y = 1, fill = col)) +
      ggplot2::geom_bar(stat = "identity", width = 1) +
      ggplot2::geom_text(ggplot2::aes(label = col), vjust = 40) +
      ggplot2::scale_fill_manual(values = pal) +
      theme_mcom(legend = "no") +
      ggplot2::theme(axis.text.x = ggplot2::element_blank(),
                 axis.text.y = ggplot2::element_blank())
 
    
  }
  
}
view_palette("secondary")
