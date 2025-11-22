#use readxl//install.packages("readxl")
library(readxl)
#import the excel file to a data frame.
fruit_prices<-read_excel("D:\\Education\\Second year\\First term\\Introduction To Data Science\\Project\\Fruit-Prices-2020.xlsx")
#print the data frame,using print method with n paramater to read all rows in the file.
print(fruit_prices,n=63)


#Data Cleaning
#1-duplicated rows are in your data
if(sum(duplicated(fruit_prices))==0){
  paste("No Dublicated Values ",sum(duplicated(fruit_prices)))
}else{
  paste("Number of duplicated rows :",sum(duplicated(fruit_prices)))
}

#2-which rows have duplicated values
duplicated(fruit_prices)

#3-Select only all distinct rows //install.packages("dplyr")
library(dplyr)
print(distinct(fruit_prices),n=63)
#4-sum of NA values
if(sum(is.na(fruit_prices)==0)){
  paste("There aren't NA Values",sum(is.na(fruit_prices)))
}else{
  paste("Number of NA values :",sum(is.na(fruit_prices)))
}

#unsupervised technique -> k-means
#retailprice and CupEquivalentPrice columns
fruit_prices_k<-fruit_prices[,c(3,8)]
print(fruit_prices_k,n=63)
Kmean_clustering_fruits<-kmeans(fruit_prices_k,centers = 2)
Kmean_clustering_fruits

#Supervised learning technique ->Decision Tree
#columns from 1 to 10
fruit_prices_tree<-fruit_prices[1:10,]
fruit_prices_tree
#use rpart 
library(rpart)
tree<-rpart(Form ~ Fruit + Yield + RetailPriceUnit, 
            data =fruit_prices_tree , minsplit=2)
tree
library(rpart.plot)
rpart.plot(tree)
boxplot(x = fruit_prices$RetailPrice, 
        xlab = "Fruits",
        main = "Compare Fruits Prices")


barplot(height = fruit_prices$CupEquivalentPrice, 
        names.arg = fruit_prices$Fruit,
        xlab = "Fruits",
        ylab = "Cup Price",
        col = "cyan",
        main = "Compare Fruits Cup Prices")


barplot(height = fruit_prices$CupEquivalentSize, 
        names.arg = fruit_prices$Fruit,
        xlab = "Fruits",
        ylab = "Cup Size",
        col = "orange",
        main = "Compare Fruits Cup Sizes")

plot(x=fruit_prices$RetailPrice,y=fruit_prices$Yield,xlab = "Price",ylab="Yeild",main="Price Vs Yeild",col=("red"))


form_counts <- table(fruit_prices$Form)

# Define a custom color palette
custom_colors <- c("cyan", "#3477eb", "#34eb77", "orange","#e05404")

# Create a pie chart with custom colors
pie(form_counts, labels = names(form_counts), col = custom_colors,
    main = "Form Distribution of Fruits", cex.main = 1.2)


# assuming fruit_prices is your dataframe and assuming Form is the column indicating the form of each fruit
# and RetailPrice is the column indicating retail prices

# calculate average retail price for each form
average_prices <- tapply(fruit_prices$RetailPrice, fruit_prices$Form, mean)

# define blue and green colors
bar_colors <- c("lightblue", "skyblue", "darkcyan", "lightgreen", "mediumseagreen")




# create  bar plot
barplot(average_prices, col = bar_colors,
        main = "Average Retail Prices by Form",
        xlab = "Form", ylab = "Average Retail Price",
        border = "black", ylim = c(0, max(average_prices) + 0.5))


#install.packages("shiny")

library(shiny)
library(rpart.plot)
ui <- fluidPage(
  
  # App title ----
  titlePanel("Data Science Project"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Buttons that each shows a specific plot ----
    sidebarPanel(
      
      # Buttons to display specific graphs ----
      actionButton(inputId = "boxplotButton", label = "Boxplot"),
      actionButton(inputId = "barplotCupPricesButton", label = "Barplot - Cup Prices"),
      actionButton(inputId = "barplotCupSizesButton", label = "Barplot - Cup Sizes"),
      actionButton(inputId = "plotPricesVsYeildButton", label = "Plot - Prices vs Yeild"),
      actionButton(inputId = "piePlotButton", label = "Pie Plot - Form Distribution"),
      actionButton(inputId = "barplotAveragePricesButton", label = "Barplot - Average Retail Prices"),
      actionButton(inputId = "treePlotButton", label = "Decision Tree")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  
  observeEvent(input$boxplotButton, {
    output$distPlot <- renderPlot({
      boxplot_prices <- boxplot(x = fruit_prices$RetailPrice, 
                                xlab = "Fruits",
                                main = "Compare Fruits Prices")
      boxplot_prices
    })
  })
  
  observeEvent(input$barplotCupPricesButton, {
    output$distPlot <- renderPlot({
      barpolot_cupprices <- barplot(height = fruit_prices$CupEquivalentPrice, 
                                    names.arg = fruit_prices$Fruit,
                                    xlab = "Fruits",
                                    ylab = "Cup Price",
                                    col = "cyan",
                                    main = "Compare Fruits Cup Prices")
      barpolot_cupprices
    })
  })
  
  observeEvent(input$barplotCupSizesButton, {
    output$distPlot <- renderPlot({
      barplot_cupsizes <- barplot(height = fruit_prices$CupEquivalentSize, 
                                  names.arg = fruit_prices$Fruit,
                                  xlab = "Fruits",
                                  ylab = "Cup Size",
                                  col = "orange",
                                  main = "Compare Fruits Cup Sizes")
      barplot_cupsizes
    })
  })
  
  observeEvent(input$plotPricesVsYeildButton, {
    output$distPlot <- renderPlot({
      plot_prices_vs_yeild <- plot(x = fruit_prices$RetailPrice, y = fruit_prices$Yield, 
                                   xlab = "Price", ylab = "Yeild", main = "Price Vs Yeild", col = "red")
      plot_prices_vs_yeild
    })
  })
  
  observeEvent(input$piePlotButton, {
    output$distPlot <- renderPlot({
      form_counts <- table(fruit_prices$Form)
      custom_colors <- c("cyan", "#3477eb", "#34eb77", "orange","#e05404")
      pie_plot <- pie(form_counts, labels = names(form_counts), col = custom_colors,
                      main = "Form Distribution of Fruits", cex.main = 1.2)
      pie_plot
    })
  })
  
  observeEvent(input$barplotAveragePricesButton, {
    output$distPlot <- renderPlot({
      average_prices <- tapply(fruit_prices$RetailPrice, fruit_prices$Form, mean)
      bar_colors <- c("lightblue", "skyblue", "darkcyan", "lightgreen", "mediumseagreen")
      barplot_average_prices <- barplot(average_prices, col = bar_colors,
                                        main = "Average Retail Prices by Form",
                                        xlab = "Form", ylab = "Average Retail Price",
                                        border = "black", ylim = c(0, max(average_prices) + 0.5))
      barplot_average_prices
    })
  })
  
  observeEvent(input$treePlotButton, {
    output$distPlot <- renderPlot({
      tree_plot <- rpart.plot(tree)
    })
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)


