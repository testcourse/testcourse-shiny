library(shiny)
shinyServer(
  function(input, output) {
    output$newHist  <- renderPlot({      
      mean=input$mean 
      sd=input$sd
      lb=input$mean-5*input$sd
      ub=input$mean+input$p*input$sd
    
      x <- seq(-5,5,length=100)*sd + mean
      hx <- dnorm(x,mean,sd)
    
      plot(x, hx, type="n", xlab="IQ Values", ylab="", main="Normal Distribution", axes=FALSE)
    
      i <- x >= lb & x <= ub
      lines(x, hx)
      polygon(c(lb,x[i],ub), c(0,hx[i],0), col="red") 
    
      area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
      result <- paste("P(IQ <=",ub,") =",
                    signif(area, digits=3))
      mtext(result,3)
      axis(1, at=seq(mean-5*sd, mean+5*sd, sd), pos=0)
      
      lines (c(mean,  mean),  c(0, mean ), col="black" ,lwd =2)
    })
  }
)