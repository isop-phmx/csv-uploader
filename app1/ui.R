
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
options(shiny.maxRequestSize=100*1024^2) # control maximal size of file allowed to upload
library(PKPDmisc)
shinyUI(
  navbarPage("Navbar",
             tabPanel("Upload Dataset",
                      fluidPage(
                        fluidRow(
                          column(4,
                                 h4("1. Upload observed data CSV file"),
                                 fileInput('real_data', 'Choose CSV File',
                                           accept=c('text/csv', 
                                                    'text/comma-separated-values,text/plain', 
                                                    '.csv')),
                                 h4("2. Upload simulated data CSV file"),
                                 fileInput('sim_data', 'Choose CSV File',
                                           accept=c('text/csv', 
                                                    'text/comma-separated-values,text/plain', 
                                                    '.csv')),
                                 h6("optional csv customizations"),
                                 p("Use these if the preview after uploading is showing that your data is not read in correctly"),
                                 checkboxInput('has_header', 'Header', TRUE),
                                 checkboxInput('has_units', 'Has Units', FALSE),
                                 tags$hr()),
                          column(4,
                                 h4("2. Select data columns"),
                                 selectInput('id', 'ID', NULL, "ID" ),
                                 selectInput('time', 'TIME', NULL, "TIME"),
                                 selectInput('dv', 'DV (eg. COBS or DV)', NULL, "DV"),
                                 selectInput('rep', 'REP', NULL, "REP"),                                
                                 h5("Be sure all dropdowns are associated with a column in the dataset 
                                    after uploading")
                                 ),
                          column(4, 
                                 h4("3. Preview Observed Data"),
                                 tableOutput('real_contents')
                                 
                          ),column(4, 
                                   h4("3. Preview Simulated Data"),
                                   tableOutput('sim_contents')
                                   
                          ))
                        
                        
                        )
  ) 
)
)


