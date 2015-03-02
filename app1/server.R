
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(PKPDmisc)
shinyServer(function(input, output, session) {
  
  
  real_data <- reactive({
    inFile <- input$real_data
    if(is.null(inFile)) return(NULL)  
    if(!is.null(inFile)) {
      if(input$has_units) {
        data <-  PKPDmisc::read_table(inFile$datapath, has_units=T)
      } else {
        data <-  PKPDmisc::read_table(inFile$datapath)
        
      }
      return(data)
    }
  })
  #note that currently sim_data cannot handle csv_wunits
  sim_data <- reactive({
    inFile2 <- input$sim_data
    if(is.null(inFile2)) return(NULL)  
    if(!is.null(inFile2)) {
      if(input$has_units) {
        data <-  PKPDmisc::read_table(inFile2$datapath, has_units=T)
      } else {
        data <-  PKPDmisc::read_table(inFile2$datapath)
        
      }
      return(data)
    }
  })
  output$real_contents <- renderTable({
    inFile3 <- input$real_data
    if(is.null(inFile3)) return(NULL) 
    # must use real_data() not real_data
      return(head(real_data()))
  })
  output$sim_contents <- renderTable({
    inFile4 <- input$sim_data
    if(is.null(inFile4)) return(NULL)  
    return(head(sim_data()))
  })
  observe({
    #not positive if observed needed but based on googling around and it works
    # http://stackoverflow.com/questions/20073948/observe-updateselectinput-based-on-first-selection
    if(!is.null(real_data)) {
      updateSelectInput(session, 'id', 'ID', names(real_data()), "ID" )
      updateSelectInput(session, 'time', 'TIME', names(real_data()), "TIME" )
      updateSelectInput(session, 'dv', 'DV (eg. CObs)', names(real_data()), "DV" )
    }
    if(!is.null(sim_data)) {
      updateSelectInput(session, 'rep', 'replicate (eg. REP)', names(sim_data()), "REP")
      
    }
  })
  })
