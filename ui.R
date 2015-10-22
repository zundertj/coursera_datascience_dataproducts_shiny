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
      p('This tool computes, based on the origin of the plant, the treatment and the amount of ambient carbon dioxide how much CO2 the plant will take up. You can enter this in the left panel. At the bottom of this page is the answer.'),
      h4('Source'),
      p(' Potvin, C., Lechowicz, M. J. and Tardif, S. (1990) “The statistical analysis of ecophysiological response curves obtained from experiments involving repeated measures”, Ecology, 71, 1389–1400.
      Pinheiro, J. C. and Bates, D. M. (2000) Mixed-effects Models in S and S-PLUS, Springer.'),
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