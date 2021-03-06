#  File src/library/tcltk/R/tclarray.R
#  Part of the R package, http://www.R-project.org
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  http://www.r-project.org/Licenses/

tclArray <- function() {
    x <- tclVar()
    tcl("unset", x)
    tcl("array", "set", x, "")
    class(x) <- c(class(x), "tclArray")
    x
}

"[[.tclArray" <- function(x, ...) {
    name <- as.character(x)
    i <- paste(...,sep=",")
    rval <- .External("RTcl_GetArrayElem", name, i, PACKAGE = "tcltk")
    if (!is.null(rval)) class(rval)<-"tclObj"
    rval
}

"[[<-.tclArray" <- function(x, ..., value){
    name <- as.character(x)
    i <- paste(..., sep=",")
    if (is.null(value))
        .External("RTcl_RemoveArrayElem", name, i, PACKAGE = "tcltk")
    else {
        value <- as.tclObj(value)
        .External("RTcl_SetArrayElem", name, i, value, PACKAGE = "tcltk")
    }
    x
}

"$.tclArray" <- function(x, i) {
    name <- as.character(x)
    i <- as.character(i)
    rval <- .External("RTcl_GetArrayElem", name, i, PACKAGE = "tcltk")
    if (!is.null(rval)) class(rval)<-"tclObj"
    rval
}

"$<-.tclArray" <- function(x, i, value){
    name <- as.character(x)
    i <- as.character(i)
    if (is.null(value))
        .External("RTcl_RemoveArrayElem", name, i, PACKAGE = "tcltk")
    else {
        value <- as.tclObj(value)
        .External("RTcl_SetArrayElem", name, i, value, PACKAGE = "tcltk")
    }
    x
}

names.tclArray <- function(x)
    as.character(tcl("array", "names", x))

"names<-.tclArray" <- function(x, value)
    stop("cannot change names on Tcl array")

length.tclArray <- function(x)
    as.integer(tcl("array", "size", x))

"length<-.tclArray" <- function(x, value)
    stop("cannot set length of Tcl array")



