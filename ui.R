#ui.R

library(shiny)

fluidPage(
  
  titlePanel("Simpson Website"),
  
  sidebarLayout(
    sidebarPanel(
      
      textInput("fnx", "Function :", "x^2"),
      numericInput("a", "Start point :", 0),
      numericInput("b", "End point :", 1),
      numericInput("n", "N :", 10),
      
      helpText("This is a program for calcurating",
               "the numerical approximation of definite integrals."),
      
      submitButton("summit")
    ),
    
    
    mainPanel(
      h4("In numerical analysis, Simpson's rule is a method for numerical integration, the numerical approximation of definite integrals. Specifically, it is the following approximation:"),
      img(src='https://image.slidesharecdn.com/core3simpsonsrule-090512114452-phpapp01/95/core-3-simpsons-rule-3-728.jpg?cb=1242129430',width=500,hieght=500),
      
      
      titlePanel(column(8,
                        h4("Answer : "),
                        textOutput("summary")
      )),
      plotOutput("distPlot")
      
      
    )
  )
)
