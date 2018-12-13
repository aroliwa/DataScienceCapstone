library(shiny)
library(shinydashboard)
library(shinycssloaders)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Enter text", tabName = "text", icon = icon("pencil")),
      menuItem("About application", tabName = "about", icon = icon("book"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "text",
              h2("Coursera Data Science Capstone Project"),
              tags$img(src = "logocoursera.png", height=100, width =250),
              hr(),
              textInput("text", label = h2("Enter text..."), value = ""),
              
              
              tags$small("(The app runs slightly slow, so please wait a moment for the prediction to appear)"),
              p("The predicted next word:"),
              
              fluidRow(column(3, withSpinner(verbatimTextOutput("value"), 5) ))
              
      ),
      
      tabItem(tabName = "about",
              includeHTML("about.html")
              
      )
    )
    
  )
)