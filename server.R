library(shiny)
library(dplyr)
Dt <- read.csv('./data/german_credit-1.csv')
server <- shinyServer(
  function(input, output) {
  MyData <- reactive({
    if(input$RD1==2){
    inFile<-input$file1
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath, header=input$header, sep=input$sep, 
             quote=input$quote)
    
    }else{
      Dt
    }
})
  Col<-reactive({input$Col})
  Creditability<-reactive({input$Creditability})
  Account.Balance <-reactive({input$Account.Balance})
  PaymentStatusofPreviousCredit<-reactive({input$PaymentStatusofPreviousCredit})
  Purpose <-reactive({input$Purpose})
  Credit.Amount<-reactive({input$Credit.Amoun})
  Value.Savings.Stocks<-reactive({input$Value.Savings.Stocks})
  
  Length.of.current.employment <-reactive({input$Length.of.current.employmentn})
  Instalment.per.cent<-reactive({input$Instalment.per.cen})
  Sex...Marital.Status<-reactive({input$Sex...Marital.Status})
  
  Guarantors<-reactive({input$Guarantors<-reactive})
  Duration.in.Current.address<-reactive({input$Duration.in.Current.address})
  Most.valuable.available.asset<-reactive({input$Most.valuable.available.asset})

  Age..years.<-reactive({input$Age..years.})
  Concurrent.Credits<-reactive({input$Concurrent.Credits})
  Type.of.apartment<-reactive({input$Type.of.apartment})
  
  No.of.Credits.at.this.Bank<-reactive({input$No.of.Credits.at.this.Bank})
  Occupation<-reactive({input$Occupation})
  No.of.dependents<-reactive({input$No.of.dependents})
  
  Telephone<-reactive({input$Telephone})
  Foreign.Worker<-reactive({input$Foreign.Worker})
  
    output$oid1 = renderPrint({input$Account.Balance})
    output$oid2 = renderPrint({input$Duration.of.Credit..month.})
    output$oid3 = renderPrint({input$PaymentStatusofPreviousCredit})
    
    output$oid4 = renderPrint({input$Purpose})
    output$oid5 = renderPrint({input$Credit.Amount})
    output$oid6 = renderPrint({input$Value.Savings.Stocks})
    
    output$oid7 = renderPrint({input$Length.of.current.employment})
    output$oid8 = renderPrint({input$Instalment.per.cent})
    output$oid9 = renderPrint({input$Sex...Marital.Status})
    
    output$oid10 = renderPrint({input$Guarantors})
    output$oid11 = renderPrint({input$Duration.in.Current.address})
    output$oid12 = renderPrint({input$Most.valuable.available.asset})
    
    output$oid13 = renderPrint({input$Age..years.})
    output$oid14 = renderPrint({input$Concurrent.Credits})
    output$oid15 = renderPrint({input$Type.of.apartment})
    
    output$oid16 = renderPrint({input$No.of.Credits.at.this.Bank})
    output$oid17 = renderPrint({input$Occupation})
    output$oid18 = renderPrint({input$No.of.dependents})
    
    output$oid19 = renderPrint({input$Telephone})
    output$oid20 = renderPrint({input$Foreign.Worker})

      new2<-reactive({
      input$update
      isolate(data.frame(
                 Account.Balance=input$Account.Balance, Duration.of.Credit..month.=input$Duration.of.Credit..month.,
                 PaymentStatusofPreviousCredit=input$PaymentStatusofPreviousCredit,
                 
                 Purpose=input$Purpose, Credit.Amount=input$Credit.Amount, Value.Savings.Stocks=input$Value.Savings.Stocks,
                 Length.of.current.employment=input$Length.of.current.employment, Instalment.per.cent=input$Instalment.per.cent, 
                 Sex...Marital.Status=input$Sex...Marital.Status,
                 
                 Guarantors=input$Guarantors, Duration.in.Current.address=input$Duration.in.Current.address,
                 Most.valuable.available.asset=input$Most.valuable.available.asset,
                 Age..years.=input$Age..years., Concurrent.Credits=input$Concurrent.Credits, 
                 
                 Type.of.apartment=input$Type.of.apartment, No.of.Credits.at.this.Bank=input$No.of.Credits.at.this.Bank,
                 Occupation=input$Occupation, No.of.dependents=input$No.of.dependents, 
                 
                 Telephone=input$Telephone, Foreign.Worker=input$Foreign.Worker))
      })
 
    p <- reactive({
      input$update
      g <- glm(Creditability~
                 Account.Balance+ Duration.of.Credit..month.+ PaymentStatusofPreviousCredit+
                 Purpose+ Credit.Amount+ Value.Savings.Stocks+
                 Length.of.current.employment+ Instalment.per.cent+ Sex...Marital.Status+
                 Guarantors+ Duration.in.Current.address+ Most.valuable.available.asset+
                 Age..years.+ Concurrent.Credits+ Type.of.apartment+
                 No.of.Credits.at.this.Bank+ Occupation+ No.of.dependents+
                 Telephone+ Foreign.Worker, 
                 data = MyData(), family=binomial())
      predict(g,newdata = new2(),type = 'response')})
    
    output$oid21 = renderText({
      if(p() >= .5) 
        "Congratulation credit approved"
      else 
        "Sorry your credit is pending"
      }) 
  }
)