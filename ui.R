library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Grass plant carbon dioxide uptake rates"),
    
    sidebarPanel(
      numericInput('conc', 'Ambient carbon dioxide concentration (mL/L)', 100, min = 0, max = 1000, step = 10),
      radioButtons(inputId="type", label="Where does your plant come from?", 
                   choices=c("Quebec","Mississippi")),
      radioButtons(inputId="treatment", label="How did you treat your plant?", 
                   choices=c("nonchilled","chilled"))
    ),
    mainPanel(
      h3('Explanation'),
      p('This tool computes, based on the origin of the plant, the treatment and the amount of ambient carbon dioxide how much CO2 the plant will take up.'),
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputType"),
      verbatimTextOutput("inputTreatment"),
      verbatimTextOutput("inputConc"),
      h4('which is predicted to have an uptake (umol/m^2 sec) of '),
      verbatimTextOutput("prediction")
    )
  )
)