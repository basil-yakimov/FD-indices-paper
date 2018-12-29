library(FD)

load("data/meadows-2018.rda")
load("data/traits-2018.rda")

d15 <- subset(dat, meta$year == 2015)
m15 <- subset(meta, year == 2015)
m15$site <- factor(m15$site)

d15 <- d15[, rownames(tr)]

absent <- which(colSums(d15) == 0)
d15 <- d15[, -absent]
tr <- tr[-absent, ]

div <- dbFD(tr[, 1:4], d15)


col4 <- c("tomato", "steelblue", "skyblue", "limegreen")


plot(div$FEve ~ div$FRic, pch = 19, col = col4[as.numeric(m15$site)])
plot(div$FEve ~ div$FDiv, pch = 19, col = col4[as.numeric(m15$site)])
plot(div$FDiv ~ div$FRic, pch = 19, col = col4[as.numeric(m15$site)])

boxplot(div$FRic ~ m15$site, col = col4)
boxplot(div$FEve ~ m15$site, col = col4)
boxplot(div$FDiv ~ m15$site, col = col4)
