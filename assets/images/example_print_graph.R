library(lincolndissdata)
library(RColorBrewer)

set.seed(105)

yr_graph <- function(early, late) {

  sg_edge <- bm_print_edges %>%
    filter(between(datestart, early, late)) %>%
    semi_join(bm_print_nodes %>% filter(birth <= late, death >= early), by = c("target" = "id")) %>%
    semi_join(bm_print_nodes %>% filter(birth <= late, death >= early), by = c("source" = "id")) %>%
    semi_join(bm_node_nationalities %>% filter(nationality == "Dutch"), by = c("target" = "id")) %>%
    semi_join(bm_node_nationalities %>% filter(nationality == "Dutch"), by = c("source" = "id"))

  sg_node <- bm_print_nodes %>% filter(id %in% union(sg_edge$target, sg_edge$source))

  sg <- graph_from_data_frame(sg_edge, directed = FALSE, vertices = sg_node)
  sg <- simplify(sg)
  big_c_memb <- components(sg)$membership == 1

  # Big component
  bsg <- induced_subgraph(sg, vids = V(sg)[big_c_memb])

  V(bsg)$degree <- degree(bsg, normalized = TRUE)

  # Top names
  top_names <- V(bsg)$degree %in% tail(sort(V(bsg)$degree), 10)

  dpal <- brewer.pal(9, name = "Greens")[1:7]

  V(bsg)$label <- ifelse(top_names, V(bsg)$realname, "")
  V(bsg)$degcat <- cut(V(bsg)$degree, breaks = unique(quantile(V(bsg)$degree, probs = seq(0, 1, 0.1))))
  V(bsg)$color <- dpal[V(bsg)$degcat]
  V(bsg)$frame.color <- "gray"
  E(bsg)$color <- "gray"
  V(bsg)$size = 30 * V(bsg)$degree + 3

  return(bsg)
}

g1 <- yr_graph(early = 1580, late = 1590)
g2 <- yr_graph(early = 1640, late = 1650)


png(file = "assets/images/timeslice_examples.png", res = 1200, width = 10800, height = 8400)
par(mfrow = c(1, 2), mar = c(0, 0, 0, 0))
plot(
  g1,
  layout = layout_with_dh,
  vertex.label.color = "black",
  vertex.label.cex = 0.7)
plot(
  g2,
  layout = layout_with_dh,
  vertex.label.color = "black",
  vertex.label.cex = 0.7)
dev.off()
