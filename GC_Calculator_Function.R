GC_calculator <- function(gene) {
  gene_input = readline(prompt = 'Submit the gene sequence here: ') # for the user to input the gene sequence
  gene_letters <- strsplit(gene_input, split = '')[[1]] # to break it into infividual nucleotides
  gene_letters <- toupper(gene_letters) # to handle user input in lowercase by converting it into uppercase
  gene_length <- length(gene_letters) 
  gc_counter <- 0 #initializing the counter
  for (nuc in gene_letters) {
    if (nuc == 'G'| nuc == 'C')
      gc_counter <- gc_counter + 1 
  }
  
  gc_percentage <- (gc_counter/gene_length) *100
  return(gc_percentage)
}