# things i want it to do

# fill?
#ggplot2::scale_fill_manual(values=rev(c(mcom_palette2()[1:length(unique(stkd_channels$name))])))

# label
#geom_text(aes(label=round(tot_sessions/1000000, 1)), position=position_dodge(width=0.9), hjust=-0.25, colour= mcom_space_gray(), size = 3)

# option to remove ledgened
#legend.position = "none"

#option to remove axis
#axis.text.x=element_blank()


# trials
ggplot2::ggplot(data=mtcars, ggplot2::aes(x=disp, y=mpg, colour = as.factor(cyl))) +
  ggplot2::geom_line() +
  theme_mcom(title = "My Chart", subtitle = "My Subtitle", xtitle = "X Axis", ytitle = "Y Axis", source = "My Source")
