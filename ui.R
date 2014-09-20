library(shiny)
shinyUI (pageWithSidebar (
  headerPanel ("Illustrating inputs" ),
  sidebarPanel (
    numericInput('mean', 'Population mu',  50, min =  -100, max = 100 , step =  1),
    numericInput('sd', 'Population standard deviation',  0.1, min =  0.1, max = 20 , step =  1),
    sliderInput ('p', 'p value',value =  0, min = -2 , max =  2, step =  0.1 ,),
    submitButton( 'Submit '),
    p('This application will show the p value for a give mu, sd and q value'),
    p('mu [-100, 100], step=1'),
    p('sd [0.1, 20], step=1'),
    p('q [-2,2], step=1')
  ),
  mainPanel (
    plotOutput ('newHist')
  )
))

