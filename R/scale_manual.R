scale_fill_mcom <- function(fill_varible, palette = "original"){

  if(palette == "original"){
    ggplot2::scale_fill_manual(values=c(mcom_palette()[1:length(unique(fill_varible))]))
  }

  else if(palette == "primary"){
    ggplot2::scale_fill_manual(values=c(mcom_palette_primary()[1:length(unique(fill_varible))]))
  }

  else if(palette == "secondary"){
    ggplot2::scale_fill_manual(values=c(mcom_palette_secondary()[1:length(unique(fill_varible))]))
  }

}




scale_colour_mcom <- function(colour_varible, palette = "original"){

  if(palette == "original"){
    ggplot2::scale_colour_manual(values=c(mcom_palette()[1:length(unique(colour_varible))]))
  }

  else if(palette == "primary"){
    ggplot2::scale_colour_manual(values=c(mcom_palette_primary()[1:length(unique(colour_varible))]))
  }

  else if(palette == "secondary"){
    ggplot2::scale_colour_manual(values=c(mcom_palette_secondary()[1:length(unique(colour_varible))]))
  }
}
