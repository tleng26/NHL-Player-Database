library(tidyverse)
library(shiny)

nhlstats = read_csv("skaters_2021.csv")

ui = navbarPage(
  title = "2021 NHL Statistics",
  tabPanel(
    title = "Input / Visualization",
    titlePanel(title = "Points"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "team",
          label = "team:",
          choices = sort(unique(stats$team))),
        selectInput(
          inputId = "position",
          label = "position:",
          choices = sort(unique(stats$position))),
        selectInput(
          inputId = "name",
          label = "name:",
          choices = sort(unique(stats$name))),
        checkboxInput(inputId = "teampos",
                      label = "Filter Table to Team and Position",
                      value = FALSE)
      ),
      mainPanel(plotOutput("distPlot"))
    )
  ),
  tabPanel(title = "Table", dataTableOutput("table")),
  tabPanel(title = "About", includeMarkdown("about.Rmd"))
)

server <- function(input, output) {

  stat_team = reactive({
    stats |>
      filter(team == input$team)
  })

  observeEvent(
    eventExpr = input$team,
    handlerExpr = {
      updateSelectInput(inputId = "position",
                        choices = sort(unique(stat_team()$position)),
                        selected = sort(unique(stat_team()$position)))
      updateSelectInput(inputId = "name",
                        choices = sort(unique(stat_team_pos()$name)),
                        selected = sort(unique(stat_team_pos()$name)))
      }
    )

  stat_team_pos = reactive({
    stat_team() |>
      filter(position == input$position)
  })

  observeEvent(
    eventExpr = input$position,
    handlerExpr = {
      updateSelectInput(inputId = "name",
                        choices = sort(unique(stat_team_pos()$name)),
                        selected = sort(unique(stat_team_pos()$name)))
    }
  )
    output$distPlot <- renderPlot({
      stats = stats |>
        filter(icetime > 3000) |>
        filter(situation == "all") |>
        filter(team == input$team) |>
        filter(position == input$position) |>
        filter(name == input$name)
      ggplot(stats, aes(x = name, y = I_F_points)) +
        geom_bar(stat = "identity", fill = "black", width = 0.5) +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        xlab("Player") +
        ylab("Points")
    })
    output$table = renderDataTable({

      tab = stat_team() |>
        calc_efficiency()

      if (input$teampos) {
        tab = tab |>
          filter(position == input$position)
      }

      tab
    })
}

shinyApp(ui = ui, server = server)

