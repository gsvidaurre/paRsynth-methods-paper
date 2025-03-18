# Created: Vanessa Ferdinand
# Updated: Grace Smith-Vidaurre

########################################################################
# overview:

# find_best_mapping() finds the best mapping of true labels to inferred labels
# and then calculates the percentage of rows in your dataframe that follow that mapping.
# that percentage is the "accuracy score" you're looking for.

########################################################################
# for testing the function: create a demo dataframe

# k <- 10
# true_label <- c(rep(seq(1:k),10))
# inferred_label <- sample(c(rep(letters[1:k],10)))
# signal <- seq(1:length(true_label))
# 
# df <- data.frame(signal,true_label,inferred_label)
# head(df)
# nrow(df)
# 
# table(df$true_label)
# table(df$inferred_label)

########################################################################
# how many unique sets of mappings are there between the true and inferred labels?
# we need to calculate the number of bipartite combinations (i.e. "matchings")

# given a bipartite graph, a "matching" is a subset of the edges 
# for which every vertex belongs to exactly one of the edges

# we want to calculate the accuracy score for every "matching"
# and select the matching with the best accuracy score
# to be the "best matching"

# when you have k true labels and k inferred labels
# there are k! bipartite matchings that this code will compute an accuracy for
# (draw the tree yourself and you'll see why it's a factorial)
# factorial(k)
# hot tip: check how big this number is before you run the code!

# input: a dataframe with columns named true_label and inferred_label
# output: a list in the following order
# 1) the best mapping
# 2) the accuracy of that mapping (i.e. maximum accuracy found)
# 3) the list of accuracies computed for each mapping
find_best_mapping <- function(df) {
  # get the set of true labels and the set of inferred labels
  true_label_set <- sort(unique(df$true_label))
  inferred_label_set <- sort(unique(df$inferred_label))
  
  # generate all possible mappings between the two sets of labels
  # the ith inferred label maps to the ith label in true_label_set
  mappings <- combinat::permn(inferred_label_set)
  # mappings
  
  # this calculation only works when the two labels sets are the same size
  if (length(true_label_set) != length(inferred_label_set)) { 
    warning(print("The number of labels in the true set and the inferred set are not the same!")) 
  }
  
  x <- length(true_label_set)
  n <- factorial(x)
  print(paste("checking",n,"mappings"))
  
  # for each mapping, calculate the accuracy
  accs <- c()
  for (i in 1:length(mappings)) {
    # if (i %% 100==0) { print(paste(i,"of",n)) }  # print progress every 100th iteration
    # if (i == n) { print("done")}
    
    # put the count of each label pair in matrix format
    tab <- table(df$true_label,df$inferred_label)
    
    # order the table by the current mapping 
    # so the diagonal will contain the counts for this mapping
    tab <- tab[true_label_set,mappings[[i]]]
    
    # accuracy is the % of rows in the df that follows the mapping
    hits <- sum(diag(tab))
    accuracy <- hits/sum(tab)
    
    accs[i] <- accuracy
  }
  
  # if there was a single maximum accuracy, then return the maximum accuracy
  if(length(which(accs == max(accs))) == 1){
    
    best <- mappings[[which(accs == max(accs))]]
    
  # if there were ties for the maximum accuracy, then randomly sample the mappings from among these ties
  } else {
    
    wh <- which(accs == max(accs))
    best <- mappings[[sample(wh, size = 1)]]
    
  }
  
  best_mapping <- rbind(true_label_set,best)
  
  row.names(best_mapping) <- c("true label","inferred label")
  
  return(list(best_mapping = best_mapping, maximum_accuracy = max(accs), accuracies = accs))
}

# example usage:
# find_best_mapping(df)
# system.time(find_best_mapping(df))

# btw I think the best mapping calculated in this way is guaranteed to be the
# one with the highest mutual information between true labels and inferred labels
# I wanna check that later (and for cases where k differs between true and inferred)

