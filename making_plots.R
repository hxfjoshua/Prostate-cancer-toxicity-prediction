setwd("E:/Mizzou Stat Master program/Bhangoo_Prostate_20191024/0")

# library(readbitmap)
# bladder_img <- read.bitmap("bladder.bitmap",3)



# read voxel data
bladder_voxel <- read.csv("bladder_PerVoxelData.csv",header = TRUE)
bowel_small_voxel <- read.csv("bowel_small_PerVoxelData.csv",header = TRUE)
ctv_voxel <- read.csv("ctv_PerVoxelData.csv",header = TRUE)
penile_bulb_voxel <- read.csv("penile_bulb_PerVoxelData.csv",header = TRUE)
prostate_voxel <- read.csv("prostate_PerVoxelData.csv",header = TRUE)
rectum_voxel <- read.csv("rectum_PerVoxelData.csv",header = TRUE)
sv_voxel <- read.csv("sv_PerVoxelData.csv",header = TRUE)

all_organs <- rbind(bladder_voxel,
                    bowel_small_voxel,
                    ctv_voxel,
                    penile_bulb_voxel,
                    prostate_voxel,
                    rectum_voxel,
                    sv_voxel)

# plot voxel data
library(plotly)
voxel_plot <- function(data,title, scalename = "EQD2dose"){
  p <- plot_ly(data,
               x = ~x,
               y = ~y,
               z = ~z,
               marker = list(color = ~EQD2dose, showscale = TRUE)) %>%
    add_markers() %>%
    layout(title = title,
           annotations = list(x = 1.13,
                              y = 1.05,
                              text = scalename,
                              xref = 'paper',
                              yref = 'paper',
                              showarrow = FALSE))
  p
}

all <- voxel_plot(data = all_organs,title = "All organs voxel plot")
all

bladder <- voxel_plot(data = bladder_voxel,title = "Bladder voxel plot")
bladder

bowel_small <- voxel_plot(data = bowel_small_voxel,title = "Bowel_small voxel plot")
bowel_small

ctv <- voxel_plot(data = ctv_voxel,title = "ctv voxel plot")
ctv

penile_bulb <- voxel_plot(data = penile_bulb_voxel,title = "Penile_bulb voxel plot")
penile_bulb

prostate <- voxel_plot(data = prostate_voxel,title = "Prostate voxel plot")
prostate

rectum <- voxel_plot(data = rectum_voxel,title = "Rectum voxel plot")
rectum

sv <- voxel_plot(data = sv_voxel,title = "SV voxel plot")
sv

p <- subplot(bladder,bowel_small,ctv,penile_bulb,prostate,rectum,sv) %>%
  layout(title = "3D Subplots",
         scene = list(domain=list(x=c(0,0.5),y=c(1.5,2)),
                      # xaxis=axx, yaxis=axx, zaxis=axx,
                      aspectmode='cube'),
         scene2 = list(domain=list(x=c(0.5,1),y=c(1.5,2)),
                       # xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene3 = list(domain=list(x=c(0,0.5),y=c(1,1.5)),
                       # xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene4 = list(domain=list(x=c(0.5,1),y=c(1,1.5)),
                       # xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene5 = list(domain=list(x=c(0,0.5),y=c(0.5,1)),
                      # xaxis=axx, yaxis=axx, zaxis=axx,
                      aspectmode='cube'),
         scene6 = list(domain=list(x=c(0.5,1),y=c(0.5,1)),
                       # xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene7 = list(domain=list(x=c(0,0.5),y=c(0,0.5)),
                       # xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'))

p <- subplot(bladder,bowel_small) %>%
  layout(title = "3D Subplots",
         scene = list(domain=list(x=c(0,0.5),y=c(0,0.5)),
                      # xaxis=axx, yaxis=axx, zaxis=axx,
                      showscale = T,
                      aspectmode='cube'),
         scene2 = list(domain=list(x=c(0.5,1),y=c(0,0.5)),
                       # xaxis=axx, yaxis=axx, zaxis=axx,
                       showscale = T,
                       aspectmode='cube'))
p
