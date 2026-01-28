#create a vector with both lowercase and uppercase G and C's
gc_nucleotides <- c('C', 'G', 'c', 'g') 

# for the user to input the gene sequence
gene_input = readline(prompt = 'Submit the gene sequence here: ') 

# to break it into infividual nucleotides
gene_letters <- strsplit(gene_input, split = '')[[1]] 

gene_length <- length(gene_letters)

#initializing the counter
gc_counter <- 0 

#custom gc calculator function
for (nuc in gene_letters) {
  if (nuc %in% gc_nucleotides)
    gc_counter <- gc_counter + 1 
}

gc_percentage <- (gc_counter/gene_length) *100
print(gc_percentage)
