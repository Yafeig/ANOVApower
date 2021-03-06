
# This file is automatically generated, you probably don't want to edit this

jmvpowerOptions <- if (requireNamespace('jmvcore')) R6::R6Class(
    "jmvpowerOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            design = "2b*2w",
            labelnames = "AGE,old,young,SPEED,fast,slow",
            n = 80,
            sd = 1.03,
            r = 0.87,
            mu = "1.03, 1.21, 0.98, 1.01",
            plot = TRUE,
            simulate = FALSE,
            alpha_level = 0.05,
            nsims = 100,
            p_adjust = "holm", ...) {

            super$initialize(
                package='ANOVApower',
                name='jmvpower',
                requiresData=FALSE,
                ...)

            private$..design <- jmvcore::OptionString$new(
                "design",
                design,
                default="2b*2w")
            private$..labelnames <- jmvcore::OptionString$new(
                "labelnames",
                labelnames,
                default="AGE,old,young,SPEED,fast,slow")
            private$..n <- jmvcore::OptionInteger$new(
                "n",
                n,
                default=80,
                min=3)
            private$..sd <- jmvcore::OptionNumber$new(
                "sd",
                sd,
                default=1.03,
                min=0.0001)
            private$..r <- jmvcore::OptionNumber$new(
                "r",
                r,
                default=0.87)
            private$..mu <- jmvcore::OptionString$new(
                "mu",
                mu,
                default="1.03, 1.21, 0.98, 1.01")
            private$..plot <- jmvcore::OptionBool$new(
                "plot",
                plot,
                default=TRUE)
            private$..simulate <- jmvcore::OptionBool$new(
                "simulate",
                simulate,
                default=FALSE,
                hidden=TRUE)
            private$..alpha_level <- jmvcore::OptionNumber$new(
                "alpha_level",
                alpha_level,
                min=0,
                max=1,
                default=0.05)
            private$..nsims <- jmvcore::OptionInteger$new(
                "nsims",
                nsims,
                min=100,
                max=10000,
                default=100)
            private$..p_adjust <- jmvcore::OptionList$new(
                "p_adjust",
                p_adjust,
                options=list(
                    "none",
                    "holm",
                    "bonferroni",
                    "fdr"),
                default="holm")

            self$.addOption(private$..design)
            self$.addOption(private$..labelnames)
            self$.addOption(private$..n)
            self$.addOption(private$..sd)
            self$.addOption(private$..r)
            self$.addOption(private$..mu)
            self$.addOption(private$..plot)
            self$.addOption(private$..simulate)
            self$.addOption(private$..alpha_level)
            self$.addOption(private$..nsims)
            self$.addOption(private$..p_adjust)
        }),
    active = list(
        design = function() private$..design$value,
        labelnames = function() private$..labelnames$value,
        n = function() private$..n$value,
        sd = function() private$..sd$value,
        r = function() private$..r$value,
        mu = function() private$..mu$value,
        plot = function() private$..plot$value,
        simulate = function() private$..simulate$value,
        alpha_level = function() private$..alpha_level$value,
        nsims = function() private$..nsims$value,
        p_adjust = function() private$..p_adjust$value),
    private = list(
        ..design = NA,
        ..labelnames = NA,
        ..n = NA,
        ..sd = NA,
        ..r = NA,
        ..mu = NA,
        ..plot = NA,
        ..simulate = NA,
        ..alpha_level = NA,
        ..nsims = NA,
        ..p_adjust = NA)
)

jmvpowerResults <- if (requireNamespace('jmvcore')) R6::R6Class(
    inherit = jmvcore::Group,
    active = list(
        design = function() private$.items[["design"]],
        sims = function() private$.items[["sims"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="ANOVA power")
            self$add(R6::R6Class(
                inherit = jmvcore::Group,
                active = list(
                    summary = function() private$.items[["summary"]],
                    matrix = function() private$.items[["matrix"]],
                    plot = function() private$.items[["plot"]]),
                private = list(),
                public=list(
                    initialize=function(options) {
                        super$initialize(
                            options=options,
                            name="design",
                            title="Design")
                        self$add(jmvcore::Table$new(
                            options=options,
                            name="summary",
                            title="Design",
                            rows=4,
                            columns=list(
                                list(
                                    `name`="name",
                                    `title`="",
                                    `type`="text"),
                                list(
                                    `name`="value",
                                    `title`="",
                                    `type`="text")),
                            clearWith=list(
                                "design",
                                "labelnames",
                                "n",
                                "sd",
                                "r",
                                "mu")))
                        self$add(jmvcore::Table$new(
                            options=options,
                            name="matrix",
                            title="Correlation matrix",
                            columns=list(),
                            clearWith=list(
                                "design",
                                "labelnames",
                                "n",
                                "sd",
                                "r",
                                "mu")))
                        self$add(jmvcore::Image$new(
                            options=options,
                            name="plot",
                            title="Means plot",
                            visible="(plot)",
                            renderFun=".plot",
                            clearWith=list(
                                "design",
                                "labelnames",
                                "n",
                                "sd",
                                "r",
                                "mu")))}))$new(options=options))
            self$add(R6::R6Class(
                inherit = jmvcore::Group,
                active = list(
                    results = function() private$.items[["results"]],
                    multi = function() private$.items[["multi"]]),
                private = list(),
                public=list(
                    initialize=function(options) {
                        super$initialize(
                            options=options,
                            name="sims",
                            title="Simulation")
                        self$add(jmvcore::Table$new(
                            options=options,
                            name="results",
                            title="Results",
                            visible="(simulate)",
                            columns=list(
                                list(
                                    `name`="name",
                                    `title`="",
                                    `type`="text"),
                                list(
                                    `name`="power",
                                    `title`="Power"),
                                list(
                                    `name`="es",
                                    `title`="Effect-size")),
                            clearWith=list(
                                "design",
                                "labelnames",
                                "n",
                                "sd",
                                "r",
                                "mu",
                                "nsims",
                                "alpha_level",
                                "p_adjust")))
                        self$add(jmvcore::Table$new(
                            options=options,
                            name="multi",
                            title="Multiple comparisons",
                            visible="(simulate)",
                            columns=list(
                                list(
                                    `name`="name",
                                    `title`="",
                                    `type`="text"),
                                list(
                                    `name`="power",
                                    `title`="Power"),
                                list(
                                    `name`="es",
                                    `title`="Effect-size")),
                            clearWith=list(
                                "design",
                                "labelnames",
                                "n",
                                "sd",
                                "r",
                                "mu",
                                "nsims",
                                "alpha_level",
                                "p_adjust")))}))$new(options=options))}))

jmvpowerBase <- if (requireNamespace('jmvcore')) R6::R6Class(
    "jmvpowerBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = 'ANOVApower',
                name = 'jmvpower',
                version = c(1,0,0),
                options = options,
                results = jmvpowerResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE)
        }))

#' ANOVA power
#'
#'
#' @param design a string describing the design
#' @param labelnames a comma separated string describing the factor and level
#'   labels
#' @param n an integer specifying the sample size in each condition
#' @param sd a number specifying the group standard deviations
#' @param r a number specifying the correlation between dependent variables
#' @param mu a comma separated string specifying the group means
#' @param plot \code{TRUE} (default) or \code{FALSE} specifying whether to
#'   provide a means plot
#' @param simulate \code{TRUE} or \code{FALSE} (default); perform the
#'   simulation
#' @param alpha_level a number specifying the alpha level
#' @param nsims an integer specifying the number of simulations to perform
#' @param p_adjust the p-adjustment method to use
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$design$summary} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$design$matrix} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$design$plot} \tab \tab \tab \tab \tab an image \cr
#'   \code{results$sims$results} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$sims$multi} \tab \tab \tab \tab \tab a table \cr
#' }
#'
#' @importFrom utils data
#' @export
jmvpower <- function(
    design = "2b*2w",
    labelnames = "AGE,old,young,SPEED,fast,slow",
    n = 80,
    sd = 1.03,
    r = 0.87,
    mu = "1.03, 1.21, 0.98, 1.01",
    plot = TRUE,
    simulate = FALSE,
    alpha_level = 0.05,
    nsims = 100,
    p_adjust = "holm") {

    if ( ! requireNamespace('jmvcore'))
        stop('jmvpower requires jmvcore to be installed (restart may be required)')


    options <- jmvpowerOptions$new(
        design = design,
        labelnames = labelnames,
        n = n,
        sd = sd,
        r = r,
        mu = mu,
        plot = plot,
        simulate = simulate,
        alpha_level = alpha_level,
        nsims = nsims,
        p_adjust = p_adjust)

    results <- jmvpowerResults$new(
        options = options)

    analysis <- jmvpowerClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}
