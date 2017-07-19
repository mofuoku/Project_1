library(shiny)
library(ggplot2)

shinyServer(function(input, output){
  output$graph1 <- renderPlot({
    ggplot(impact, aes(x = date)) + 
      geom_line(aes(y=opd, color='steelblue')) +
      geom_line(aes(y=nopd, color='steelgreen')) +
      scale_x_date(date_breaks = "3 month", date_minor_breaks = "3 month",
                   date_labels = "%Y") + ggtitle("OPEC and non-OPEC Disruption") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      scale_color_manual(labels=c("OPEC","OPEC"), values=c("blue","red")) +
      ylab("Production Disruption")
  })


output$graph2 <- renderPlot({
  ggplot(impact, aes(x = date)) +
    geom_line(aes(y=opd_scale, color='steelblue')) +
    geom_line(aes(y=nopd_scale, color='steelgreen')) +
    scale_x_date(date_breaks = "3 month", date_minor_breaks = "3 month",
                 date_labels = "%Y") + ggtitle("OPEC and non-OPEC Disruption") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    scale_color_manual(labels=c("OPEC","OPEC"), values=c("blue","red")) +
    ylab("Production Disruption (Scaled)")
})
output$graph3 <- renderPlot({
ggplot(impact, aes(x = date)) + 
  geom_line(aes(y=opd_scale, color='steelblue')) +
  geom_line(aes(y=wti_pc_scaled, color='steelgreen')) +
  scale_x_date(date_breaks = "3 month", date_minor_breaks = "3 month",
               date_labels = "%Y") + ggtitle("OPEC vs WTI") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_color_manual(labels=c("spc_scale","wti_pc_scaled"), values=c("blue","red")) +
  ylab("Saudi vs WTI")
})
})

