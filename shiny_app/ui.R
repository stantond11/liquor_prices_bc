header <- dashboardHeader(
  title = "Durk's Shiny App"
)
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Liquor Store Prices", tabName = "tab_2", icon = icon("balance-scale")),
    menuItem("Information", tabName = "dashboard", icon = icon("dashboard")),
    tags$div(
      style = "position: absolute; bottom: 0;",
      a(
        img(
          src = "https://res.cloudinary.com/dxqnb8xjb/image/upload/v1509563497/tychobra-logo-blue_dacbnz.svg",
          width = 50
        ),
        href = "https://tychobra.com/shiny"
      )
    )
  )
)

body <- dashboardBody(
  tags$head(
    #tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    #tags$script(src = "custom.js"),
    tags$link(rel="icon", href="https://res.cloudinary.com/dxqnb8xjb/image/upload/v1499450435/logo-blue_hnvtgb.png")
  ),
  tabItems(
    tabItem(
      tabName = "dashboard",
      fluidRow(
        column(
          width = 12,
          verbatimTextOutput("debuggin")
        )
      )
    ),
    tabItem(
      tabName = "tab_2",
      fluidRow(
        column(
          width = 12,
          box(
              width=3,
            sliderInput(
              "priceInput", h2("Price"),
              min = 0, max = 130,
              value = c(20,45), pre = "$",
            ),
            radioButtons("typeInput", "Product type",
                         choices = c("BEER", "SPIRITS", "WINE"),
                         selected = "WINE"),
            uiOutput("countryOutput")
        ),
          box(
            plotOutput("coolplot"),
            br(), br(),
            tableOutput("results")
          )
        )
      )
    )
  )
)

dashboardPage(
  header,
  sidebar,
  body,
  skin = "black"
)
