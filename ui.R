library(shiny)
library(dplyr)

ui <- shinyUI(pageWithSidebar(
 headerPanel(column(10,
  h2("Clients Credibility"),
		h5("Dataset from http://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data)"),
    h6("Application Crafted by bambangpe"),
    offset = 1, align = "center")),
  sidebarPanel(
               radioButtons('RD1',label = h3(strong('Upload Data')),choices = list('Demo'=1,'Your Data' = 2),selected = 1),
               conditionalPanel(condition = 'input.RD1 == 2',fileInput('file1', h4(strong('Choose csv File')),
                                                                   accept = c('text/csv', 
                                                                            'text/comma-separated-values,text/plain', 
                                                                            '.csv')),
                                checkboxInput('header', 'Header', TRUE),
                                radioButtons('sep', 'Separator',
                                             c(Comma=',',
                                               Semicolon=';',
                                               Tab='\t'),
                                             ','),
                                radioButtons('quote', 'Quote',
                                             c(None = '',
                                               'Double Quote' = '"',
                                               'Single Quote' = "'"),
                                             '"')),
               numericInput('Col',strong('Column to Analysis'),value = 2),
    h3('Choose Variable'),
    sliderInput('Account.Balance', 'Account Balance', 0, min = 1, max = 4, step = 1),
    sliderInput('Duration.of.Credit..month.', 'Duration of Credit month.', 0, min = 4, max = 72, step = 1),
    sliderInput('PaymentStatusofPreviousCredit', 'Payment Status of Previous Credit', 0,min = 0, max = 4, step = 1),
    #Payment Status of Previous Credit

    sliderInput('Purpose', 'Purpose', 0, min = 1, max = 10, step = 1),
    sliderInput('Credit.Amount','Credit Amount', 0, min = 250, max = 18424, step = 1),
    sliderInput('Value.Savings.Stocks','Value Savings Stocks',0, min = 1, max = 5, step = 1),
    
    sliderInput('Length.of.current.employment','Length of current employment',0, min = 1, max = 4, step = 1),
    sliderInput('Instalment.per.cent', 'Instalment per cent', 0, min = 1, max = 4, step = 1),
    sliderInput('Sex...Marital.Status','Sex Marital Status', 0, min = 1, max = 4, step = 1),
    
    sliderInput('Guarantors','Guarantors', 0, min = 1, max = 4, step = 1),
    sliderInput('Duration.in.Current.address', 'Duration in Current address', 0, min = 1, max = 4, step = 1),
    sliderInput('Most.valuable.available.asset','Most valuable available asset',0, min = 1, max = 4, step = 1),
    
    sliderInput('Age..years.','Age years.',0, min = 1, max = 4, step = 1),
    sliderInput('Concurrent.Credits', 'Concurrent Credits', 0, min = 1, max = 3, step = 1), 
    sliderInput('Type.of.apartment','Type of apartment',0, min = 1, max = 4, step = 1),
   
    sliderInput('No.of.Credits.at.this.Bank','No of Credits at this Bank',0, min = 1, max = 4, step = 1),
    sliderInput('Occupation', 'Occupation', 0, min = 1, max = 4, step = 1), 
    sliderInput('No.of.dependents','No of dependents', 0, min = 1, max = 2, step = 1),
    
    sliderInput('Telephone','Telephone', 0, min = 1, max = 2, step = 1),
    sliderInput('Foreign.Worker', 'Foreign Worker', 0, min = 1, max = 2, step = 1), 
    actionButton('update', h2('Click process'))),

sidebarPanel(
    tableOutput('table'),
    h3('Variable value'),
   
    h4('Account Balance'),
    verbatimTextOutput('oid1'),
    h4('Duration of Credit month.'),
    verbatimTextOutput('oid2'),

    h4('Payment Status of Previous Credit'), 
    verbatimTextOutput('oid3'),
    h4('Purpose'),
    verbatimTextOutput('oid4'),
    h4('Credit Amount'),
    verbatimTextOutput('oid5'),

    h4('Value Savings Stocks'), 
    verbatimTextOutput('oid6'),
    h4('Length of current employment'),
    verbatimTextOutput('oid7'),
    h4('Instalment per cent'),
    verbatimTextOutput('oid8'),

    h4('Sex Marital Status'), 
    verbatimTextOutput('oid9'),
    h4('Guarantors'),
    verbatimTextOutput('oid10'),
    h4('Duration in Current address'),
    verbatimTextOutput('oid11'),

    h4('Most valuable available asset'), 
    verbatimTextOutput('oid12'),
    h4('Age years.'),
    verbatimTextOutput('oid13'),
    h4('Concurrent Credits'),
    verbatimTextOutput('oid14'),  

    h4('Type of apartment'), 
    verbatimTextOutput('oid15'),
    h4('No of Credits at this Bank'),
    verbatimTextOutput('oid16'),
    h4('Occupation'),
    verbatimTextOutput('oid17'),  

    h4('No of dependents'), 
    verbatimTextOutput('oid18'),
    h4('Telephone'),
    verbatimTextOutput('oid19'),
    h4('Foreign Worker'),
    verbatimTextOutput('oid20'),

    h2('Result clients credibility'),
    textOutput('oid21'),
    
    tags$head(tags$style('#oid21
                                {color: blue;
                                 font-size: 20px;
                                 font-style: bold;
                                 background-color: gainsboro;
                                 border: 2px #7FFFD4 double;
                                 padding: 60px;
                                 text-align: left;

                                }'
                         )
              )

    )
  
))