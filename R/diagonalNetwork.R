#' Create Reingold-Tilford Tree network diagrams.
#'
#' @param List a hierarchical list object with a root node and children.
#' @param height height for the network graph's frame area in pixels (if
#'   \code{NULL} then height is automatically determined based on context)
#' @param width numeric width for the network graph's frame area in pixels (if
#'   \code{NULL} then width is automatically determined based on context)
#' @param fontSize numeric font size in pixels for the node text labels.
#' @param fontFamily font family for the node text labels.
#' @param linkColour character string specifying the colour you want the link
#' lines to be. Multiple formats supported (e.g. hexadecimal).
#' @param nodeColour character string specifying the colour you want the node
#' circles to be. Multiple formats supported (e.g. hexadecimal).
#' @param nodeStroke character string specifying the colour you want the node
#' perimeter to be. Multiple formats supported (e.g. hexadecimal).
#' @param textColour character string specifying the colour you want the text to
#' be before they are clicked. Multiple formats supported (e.g. hexadecimal).
#' @param opacity numeric value of the proportion opaque you would like the
#' graph elements to be.
#' @param margin an integer or a named \code{list}/\code{vector} of integers
#' for the plot margins. If using a named \code{list}/\code{vector},
#' the positions \code{top}, \code{right}, \code{bottom}, \code{left}
#' are valid.  If a single integer is provided, then the value will be
#' assigned to the right margin. Set the margin appropriately
#' to accomodate long text labels.
#'
#'
#' @examples
#' \dontrun{
#' #### Create tree from JSON formatted data
#' ## Download JSON data
#' # Create URL. paste0 used purely to keep within line width.
#' URL <- paste0("https://cdn.rawgit.com/christophergandrud/nd3/",
#'               "master/JSONdata//flare.json")
#'               
#' ## Convert to list format
#' Flare <- jsonlite::fromJSON(URL, simplifyDataFrame = FALSE)
#'
#' ## Recreate Bostock example from http://bl.ocks.org/mbostock/4063550
#' diagonalNetwork(List = Flare, fontSize = 10, opacity = 0.9)
#'
#' #### Create a tree dendrogram from an R hclust object
#' hc <- hclust(dist(USArrests), "ave")
#' diagonalNetwork(as.radialNetwork(hc))
#' diagonalNetwork(as.radialNetwork(hc), fontFamily = "cursive")
#'
#' #### Create tree from a hierarchical R list
#' For an alternative structure see: http://stackoverflow.com/a/30747323/1705044
#' CanadaPC <- list(name = "Canada", children = list(list(name = "Newfoundland",
#'                     children = list(list(name = "St. John's"))),
#'                list(name = "PEI",
#'                     children = list(list(name = "Charlottetown"))),
#'                list(name = "Nova Scotia",
#'                     children = list(list(name = "Halifax"))),
#'                list(name = "New Brunswick",
#'                     children = list(list(name = "Fredericton"))),
#'                list(name = "Quebec",
#'                     children = list(list(name = "Montreal"),
#'                                     list(name = "Quebec City"))),
#'                list(name = "Ontario",
#'                     children = list(list(name = "Toronto"),
#'                                     list(name = "Ottawa"))),
#'                list(name = "Manitoba",
#'                     children = list(list(name = "Winnipeg"))),
#'                list(name = "Saskatchewan",
#'                     children = list(list(name = "Regina"))),
#'                list(name = "Nunavuet",
#'                     children = list(list(name = "Iqaluit"))),
#'                list(name = "NWT",
#'                     children = list(list(name = "Yellowknife"))),
#'                list(name = "Alberta",
#'                     children = list(list(name = "Edmonton"))),
#'                list(name = "British Columbia",
#'                     children = list(list(name = "Victoria"),
#'                                     list(name = "Vancouver"))),
#'                list(name = "Yukon",
#'                     children = list(list(name = "Whitehorse")))
#' ))
#'
#' diagonalNetwork(List = CanadaPC, fontSize = 10)
#' }
#'
#' @source Reingold. E. M., and Tilford, J. S. (1981). Tidier Drawings of Trees.
#' IEEE Transactions on Software Engineering, SE-7(2), 223-228.
#'
#' Mike Bostock: \url{http://bl.ocks.org/mbostock/4339083}.
#'
#' @export
#'
diagonalNetwork <- function(
                          List,
                          height = NULL,
                          width = NULL,
                          fontSize = 10,
                          fontFamily = "serif",
                          linkColour = "#ccc",
                          nodeColour = "#fff",
                          nodeStroke = "steelblue",
                          textColour = "#111",
                          opacity = 0.9,
                          margin = NULL)
{
    # validate input
    if (!is.list(List))
      stop("List must be a list object.")
    root <- List
    
    margin <- margin_handler(margin)

    # create options
    options = list(
        height = height,
        width = width,
        fontSize = fontSize,
        fontFamily = fontFamily,
        linkColour = linkColour,
        nodeColour = nodeColour,
        nodeStroke = nodeStroke,
        textColour = textColour,
        margin = margin,
        opacity = opacity
    )

    # create widget
    htmlwidgets::createWidget(
      name = "diagonalNetwork",
      x = list(root = root, options = options),
      width = width,
      height = height,
      htmlwidgets::sizingPolicy(padding = 10, browser.fill = TRUE),
      package = "nd3")
}

#' @rdname nd3-shiny
#' @export
diagonalNetworkOutput <- function(outputId, width = "100%", height = "800px") {
    shinyWidgetOutput(outputId, "diagonalNetwork", width, height,
                        package = "nd3")
}

#' @rdname nd3-shiny
#' @export
renderDiagonalNetwork <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) { expr <- substitute(expr) } # force quoted
    shinyRenderWidget(expr, diagonalNetworkOutput, env, quoted = TRUE)
}
