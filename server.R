#server.R
library(shiny)
library(datasets)



function(input, output) {
  
  output$summary <- renderText({
    
    input$goButton
    
    
    
    simspon_n <- function(ftn, a, b, n = 100) {
      n <- max(c(2*(n %/% 2), 4))
      h <- (b-a)/n
      x.vec1 <- seq(a+h, b-h, by = 2*h)
      x.vec2 <- seq(a+2*h, b-2*h, by = 2*h)
      f.vec1 <- sapply(x.vec1, ftn)
      f.vec2 <- sapply(x.vec2, ftn)
      S <- h/3*(ftn(a) + ftn(b) + 4*sum(f.vec1) + 2*sum(f.vec2))
      return(S)
    }
    
    fntxt<-"ftn<- function(x)
    return(FUNC)"
    
    newftn<-gsub("FUNC",input$fnx,fntxt)
    eval(parse(text=newftn))
    
    
    
    xs<-simspon_n(ftn,input$a,input$b,n=input$n)
    
    print(xs )
  })
  
  
  output$distPlot <- renderPlot({
    
    fntxt<-"ftn<- function(x)
    return(FUNC)"
    
    newftn<-gsub("FUNC",input$fnx,fntxt)
    eval(parse(text=newftn))
    
    temp<- seq(input$a,input$b,0.01)
    
    plot(x=temp,y=ftn(temp),type = "l",xlab = "x",ylab = "f(x)",col="red")
    
  })
  
  
  
}