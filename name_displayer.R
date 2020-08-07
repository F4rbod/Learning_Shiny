require(shiny)
require(shinythemes)

#difining UI
ui= fluidPage(theme = shinytheme("superhero"),
              navbarPage(title = "Name Displayer and Calculator",
                         tabPanel(title = "Display Name",
                                  sidebarPanel(
                                    tags$h3("Input:"),
                                    textInput(inputId = "first_name", label = "First Name", value = "John"),
                                    textInput(inputId = "last_name", label = "Last Name", value = "Doe")),
                                  mainPanel(
                                    h1("Name"),
                                    h4("Output 1"),
                                    verbatimTextOutput("text_output")
                                  )
                                  ),
                         tabPanel(title= "Calculation",
                                  sidebarPanel(h3("Input"),
                                               numericInput(inputId = "n1",label = "Enter first number",value = NULL),
                                               numericInput(inputId = "n2", label = "Enter second number",value = NULL)),
                                  mainPanel(h1("Calculations"),
                                            h4("Addition"),
                                            textOutput("addition"),
                                            h4("subtraction"),
                                            textOutput("subtraction"),                                            
                                            h4("Multiplication"),
                                            textOutput("multiplication"),                                            
                                            h4("Division"),
                                            textOutput("division")))))

#defining server
server= function(input, output) {
  
  output$text_output= renderText({
    paste(input$first_name, input$last_name)
  })
  output$addition= renderText({input$n1+input$n2})
  output$subtraction= renderText({input$n1-input$n2})
  output$multiplication= renderText({input$n1**input$n2})
  output$division= renderText({input$n1/input$n2})
  
}

#creting a shiny object
shinyApp(ui = ui, server = server)
