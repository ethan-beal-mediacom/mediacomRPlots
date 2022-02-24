# primary colours
#' @export
mcom_signature_Pink <- function(){"#E1005D"}
#' @export
mcom_white <- function(){"#FFFFFF"}
#' @export
mcom_dove_gray <- function(){"#EDF2F4"}
#' @export
mcom_space_gray <- function(){"#404E5C"}
#' @export
mcom_midnight <- function(){"#011627"}
#' @export
mcom_teal <- function(){"#3FCBB6"}

# secondary colours
#' @export
mcom_orange <- function(){"#FF9914"}
#' @export
mcom_grape <- function(){"#8C035C"}
#' @export
mcom_light_pink <- function(){"#F291BF"}
#' @export
mcom_green <- function(){"#9AD348"}
#' @export
mcom_blue <- function(){"#2AB0BF"}
#' @export
mcom_purple <- function(){"#A06EBA"}



#' Function to provide a standard MediaCom colour palette
#' @return \code{vector} of hex codes
#' @examples
#' mcom_palette()
#'
#' ggplot2::ggplot(data=mtcars[1:5,], ggplot2::aes(x=rownames(mtcars)[1:5], y=mpg, fill=rownames(mtcars)[1:5])) +
#'   ggplot2::geom_col() +
#'   ggplot2::scale_fill_manual(values = mcom_palette())
#' @export
mcom_palette <- function(){
  c(
    mcom_signature_Pink(),
    mcom_teal(),
    mcom_orange(),
    mcom_grape(),
    mcom_light_pink(),
    mcom_blue(),
    mcom_purple(),
    mcom_green()
  )
}

#' @export
mcom_palette_primary <- function(){
  c(
    mcom_signature_Pink(),
    mcom_white(),
    mcom_dove_gray(),
    mcom_space_gray(),
    mcom_midnight(),
    mcom_teal()
  )
}


#' @export
mcom_palette_secondary <- function(){
  c(
    mcom_orange(),
    mcom_grape(),
    mcom_light_pink(),
    mcom_green(),
    mcom_blue(),
    mcom_purple()
  )
}

