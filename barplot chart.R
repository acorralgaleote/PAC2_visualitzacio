library(tidyverse)
library(ggsci)
library(ggpubr)

iris_plot <- iris%>%
  gather(FlPrt, Length, 1:4)%>%
  group_by(Species,FlPrt)%>%
  summarise(mnL=mean(Length),sdL=sd(Length))%>%
  ggplot(aes(reorder(Species,mnL),mnL,fill=reorder(FlPrt,mnL)))+
  geom_bar(stat = "identity", position="dodge")+
  geom_text(mapping = aes(label=mnL), position = position_dodge(width=0.8),
            cex=2.5,vjust=-4)+
  labs(title = "Mesures en cm dels òrgans florals",
       subtitle = "Llargada i amplada dels pètals i els sèpals",
       x= "Espècies", y="Llargada en cm",
       caption = "Dataset 'Iris' d'Edgar Anderson", fill="Descripció")+
  theme_pubr()+scale_fill_d3()

iris_plot
