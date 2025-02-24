# G. Smith-Vidaurre
# 24 February 2024

# Description: This is a function to calculate accuracy by class at a given social level (groups or individuals). The function finds the cluster label with the majority of signals assigned to it and uses this as the reference cluster for accuracy calculations. If there is a tie for the majority, then a reference cluster label is randomly assigned.

# Arguments: X is the data frame from MDS by a particular method (spectrographic cross-correlation or edit distance), with an added column for the cluster labels. class_column is the column of the data frame that contains the original class labels for a given social level. cluster_column is the column of the data frame that contains the predicted cluster labels for a given social level.

# The function returns a single accuracy measurement per class.

accuracy <- function(X, class_column, cluster_column){
  
  # Pull out the unique identifiers for the given social level
  ids <- unique(X[[class_column]])
  # ids
  
  return(unlist(lapply(1:length(ids), function(a){
    
    tmp_id <- ids[a]
    # tmp_id
    
    # Filter the clustering results by the current group
    clust_tmp <- X %>% 
      dplyr::filter(!!sym(class_column) == tmp_id)
    
    # glimpse(clust_tmp)
    
    # Figure out if is a majority cluster assignment across signals
    maj_cluster <- clust_tmp %>%
      # Group by the cluster labels and count rows per group
      group_by(!!sym(cluster_column)) %>% 
      dplyr::summarise(
        n = n()
      ) %>%
      dplyr::filter(n == max(n))
    
    # If there was a single cluster with the majority of assignments, then use this cluster as the baseline for accuracy calculations (no tie for the majority)
    if(nrow(maj_cluster) == 1){
      
      ref_cluster <- maj_cluster[[cluster_column]]
      
      # But if there was a tie for the cluster majority, then randomly select the reference cluster
    } else {
      
      ref_cluster <- sample(maj_cluster[[cluster_column]], size = 1)
      
    }
    
    accuracy <- length(which(clust_tmp[[cluster_column]] == ref_cluster))/nrow(clust_tmp)
    
    return(accuracy)
    
  })))
  
}
