library(shiny)
library(tm)
library(quanteda)
library(data.table)

ng2 <- fread(input = "ng2.csv")
ng3 <- fread(input = "ng3.csv")
ng4 <- fread(input = "ng4.csv")
ng5 <- fread(input = "ng5.csv")

Predict <- function(txt) {
  txtClean <- removeNumbers(removePunctuation(tolower(txt)))
  txtClean <- gsub(pattern = "  ", replacement = "", x = txtClean)
  txtClean <- strsplit(txtClean, " ")[[1]]
  
  
  
  if (length(txtClean) >= 4) {
    txtPaste <- paste(txtClean[length(txtClean)-3], txtClean[length(txtClean)-2], txtClean[length(txtClean)-1], txtClean[length(txtClean)], "" )
    txtPredicted <- head(ng5[grep(txtPaste, x = ng5$feature),], 1)
    if(length(txtPredicted$feature) > 0)
    {
      txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
      txtPredicted[length(txtPredicted)]
    }
    else 
    {
      txtPaste <- paste(txtClean[length(txtClean)-2], txtClean[length(txtClean)-1], txtClean[length(txtClean)], "" )
      txtPredicted <- head(ng4[grep(txtPaste, x = ng4$feature),], 1)
      if(length(txtPredicted$feature) > 0)
      {
        txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
        txtPredicted[length(txtPredicted)]
      }
      else 
      {
        txtPaste <- paste(txtClean[length(txtClean)-1],  txtClean[length(txtClean)], "" )
        txtPredicted <- head(ng3[grep(txtPaste, x = ng2$feature),], 1)
        if(length(txtPredicted$feature) > 0)
        {
          txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
          txtPredicted[length(txtPredicted)]
        }
        txtPaste <- paste( txtClean[length(txtClean)], "" )
        txtPredicted <- head(ng2[grep(txtPaste, x = ng2$feature),], 1)
        if(length(txtPredicted$feature) > 0)
        {
          txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
          txtPredicted[length(txtPredicted)]
        }
        else 
        {
          "NA"
        }
      }
    }
  }
  
  
  if (length(txtClean) >= 3) {
    txtPaste <- paste(txtClean[length(txtClean)-2], txtClean[length(txtClean)-1], txtClean[length(txtClean)], "" )
    txtPredicted <- head(ng4[grep(txtPaste, x = ng4$feature),], 1)
    if(length(txtPredicted$feature) > 0)
    {
      txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
      txtPredicted[length(txtPredicted)]
    }
    else 
    {
      txtPaste <- paste( txtClean[length(txtClean)-1], txtClean[length(txtClean)], "" )
      txtPredicted <- head(ng3[grep(txtPaste, x = ng3$feature),], 1)
      if(length(txtPredicted$feature) > 0)
      {
        txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
        txtPredicted[length(txtPredicted)]
      }
      else 
      {
        txtPaste <- paste( txtClean[length(txtClean)], "" )
        txtPredicted <- head(ng2[grep(txtPaste, x = ng2$feature),], 1)
        if(length(txtPredicted$feature) > 0)
        {
          txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
          txtPredicted[length(txtPredicted)]
        }
        else 
        {
          "NA"
        }
      }
    }
    
    
  }
  else if (length(txtClean) == 2){
    txtPaste <- paste( txtClean[length(txtClean)-1], txtClean[length(txtClean)], "" )
    txtPredicted <- head(ng3[grep(txtPaste, x = ng3$feature),], 1)
    if(length(txtPredicted$feature) > 0)
    {
      txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
      txtPredicted[length(txtPredicted)]
    }
    else 
    {
      txtPaste <- paste( txtClean[length(txtClean)], "" )
      txtPredicted <- head(ng2[grep(txtPaste, x = ng2$feature),], 1)
      if(length(txtPredicted$feature) > 0)
      {
        txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
        txtPredicted[length(txtPredicted)]
      }
      else 
      {
        "NA"
      }
    }
  }
  else if (length(txtClean) == 1){  
    txtPaste <- paste( txtClean[length(txtClean)], "" )
    txtPredicted <- head(ng2[grep(txtPaste, x = ng2$feature),], 1)
    if(length(txtPredicted$feature) > 0)
    {
      txtPredicted <- strsplit(txtPredicted$feature, " ")[[1]]
      txtPredicted[length(txtPredicted)]
    }
    else {
      "NA"
    }
    
    
  }
  else {
    ""
  }
}


shinyServer(function(input, output) {
  
  
  
   
  output$value <- renderText({ Predict(input$text) })
  
})
