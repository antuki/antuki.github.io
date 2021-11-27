rm(list=ls())


library(sf)
chemin_carte <- "C:/Users/Kim Antunez/Documents/Projets_R/CARTElette/CARTElette/couches_carto/IGN/COG2021"



################ Gifs millefeuille #################

# creer_couche <- function(maille){
#   couche <- st_read(paste0(chemin_carte,"/",maille,"_",2021,"_CARTElette.shp"), stringsAsFactors = FALSE)
#   return(couche)
# }
# 
#  liste_mailles <- c("COM","CV","EPCI","ARR","DEP","REG")
#  liste <- lapply(liste_mailles,creer_couche)
#  saveRDS(liste,"data/couches.RDS")

liste <- readRDS("data/couches.RDS")
liste_titres <- c("Communes","Cantons","EPCI","Arrondissements","Départements","Régions")

dev.off()
par(mar=c(0,0,13,0))
par(mfrow=c(2,3),new=TRUE)
plot(st_geometry(liste[[1]]),lwd=0.2,main=liste_titres[1],cex.main=10)
plot(st_geometry(liste[[2]]),lwd=3,main=liste_titres[2],cex.main=10)
plot(st_geometry(liste[[3]]),lwd=3,main=liste_titres[3],cex.main=10)
plot(st_geometry(liste[[4]]),lwd=3,main=liste_titres[4],cex.main=10)
plot(st_geometry(liste[[5]]),lwd=3,main=liste_titres[5],cex.main=10)
plot(st_geometry(liste[[6]]),lwd=3,main=liste_titres[6],cex.main=10)

# library(magick)
# img <- image_graph(2000, 2000, res = 96)
# 
# out <- lapply(1:length(liste), function(i) {
# #out <- lapply(3:4, function(i) {
#   par(mar=c(0,0,0,0))
#   #par(mar=c(0,0,5,0))
#   p <-plot(st_geometry(liste[[i]]),cex.main=8,lwd=3)
#   #p <-plot(st_geometry(liste[[i]]),main=liste_titres[i],cex.main=8,lwd=3)
#   print(p)
# })
# 
# animation <- image_animate(img, fps = 0.5)
# print(animation)
# image_write(animation, "img/carte_millefeuille_sanstitre.gif")


################ Carte fusions #################
theme_map2 <- function() {
  cowplot::theme_map() %+replace%
    theme(legend.position = c(0.95, 0.95),
          legend.justification = c(0, 1),
          legend.key.width = unit(1, "lines"),
          legend.text = element_text(size = 16),
          legend.title = element_text(size = 17, face= "bold"), 
          panel.grid.major = element_line(color = "transparent"), 
          plot.title = element_text(size = 13, face = "bold"), 
          plot.caption = element_text(size = 13, colour = "grey20"), 
          plot.margin = unit(c(0, 0, 0.5, 0), "cm"))
}

library(COGugaison)
table_modif_com <- cbind(COG1968, COG1968[, 1])[, c(1,4)] %>%
  setNames(c("CODGEO", "typo"))
table_modif_com[1, ]


table_modif_com <- changement_COG_typo(table_modif_com,
                                       methode_fusion = "methode_classe_fusion", mot_fusion = "mergers", annees = 1968:2021, codgeo_entree = "CODGEO", typos = "typo", donnees_insee = F)

table_modif_com$typo[table_modif_com$typo %in% (
  table_modif_com$typo[duplicated(table_modif_com$typo) & 
                         table_modif_com$typo != "mergers"])] <- "divisions"
table_modif_com$typo[which(!table_modif_com$typo %in% c("mergers", 
                                                        "divisions"))] <- "unchanged"
table_modif_com[1, ]

library(dplyr)
COM_sf <- st_read(paste0(chemin_carte,"/","COM","_",2021,"_CARTElette.shp"), stringsAsFactors = FALSE) %>%
  left_join(table_modif_com,by=c("INSEE_COM"="CODGEO")) %>%
  filter(typo!="unchanged")
REG_sf <- st_read(paste0(chemin_carte,"/","REG","_",2021,"_CARTElette.shp"), stringsAsFactors = FALSE) 

library(ggplot2)
ggplot() +
  geom_sf(data = COM_sf, color = NA, aes(fill=typo)) +
  geom_sf(data=REG_sf,color="black",fill=NA,size=1)+
  theme_map2() +
  labs(fill="Events since 1968",
       caption =  "Source: Insee, COG 2021. Map layer antuki/CARTElette"
  ) +
  coord_sf(crs = st_crs(2154))


#dafont Sixty Four Dollar Question

liste <- readRDS("data/couches.RDS")
COM_sf <- liste[[1]]
DEP_sf <- liste[[5]]

COM_sf <- left_join(COM_sf,db_2019,by=c("INSEE_COM"="code")) %>% mutate(prop=100*men/(men+women))
DEP_sf <- left_join(DEP_sf,db_dep,by=c("DEP"="DEP")) %>% mutate(prop=100*men/(men+women))

plot(DEP_sf %>% select(prop), border=NA,breaks="quantile",main="Départements",cex.main=2.2)
plot(COM_sf %>% select(prop),border=NA,breaks="quantile",main="Communes",cex.main=2.2)


pagedown::chrome_print("20190710_userToulouse.html")



###### Mini map of 53

   couche53 <- st_read(paste0("C:/Users/Kim Antunez/Documents/Projets_R/CARTElette/CARTElette/couches_carto/IGN/COG2019/COM_2019_CARTElette.shp"), stringsAsFactors = FALSE) %>% 
     filter(INSEE_COM %in% c("53120","53239","53249","53274")) %>%
     select(INSEE_COM)
saveRDS(couche53,"data/couche53.RDS")



