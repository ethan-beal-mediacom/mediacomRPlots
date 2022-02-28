# things i want it to do

# fill?
#ggplot2::scale_fill_manual(values=rev(c(mcom_palette2()[1:length(unique(stkd_channels$name))])))

# label
#geom_text(aes(label=round(tot_sessions/1000000, 1)), position=position_dodge(width=0.9), hjust=-0.25, colour= mcom_space_gray(), size = 3)

# option to remove ledgened
#legend.position = "none"

#option to remove axis
#axis.text.x=element_blank()


# trials palettes
ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(carb))) +
  ggplot2::geom_point() +
  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source", palette_name = "secondary", palette_len = 6)
  # + ggplot2::scale_colour_manual(values=c("red", "blue", "green")) # to over ride default mediacom colours



ggplot2::ggplot(data=mtcars, ggplot2::aes(x= as.factor(cyl), y=mean(mpg), fill = as.factor(gear))) +
  ggplot2::geom_col() +
  ggplot2::coord_flip() +
  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source", palette_name = "secondary")
  #scale_fill_mcom(fill_varible = mtcars$gear, palette = "original")


# theme
ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(gear))) +
  ggplot2::geom_point() +
  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source", palette_name = "secondary")




