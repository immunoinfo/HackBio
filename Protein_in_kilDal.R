#import the data file
library(data.table)
s1t2 <- fread('/Users/hemisangani/s1t2.csv')
s1t2

#extract amino acid symbols
s1t2$`1-Letter Code`
amino_acid_letters <- c(s1t2$`1-Letter Code`)
print(amino_acid_letters)

#extract weight of indivudual amino acid in Daltons
weights_of_amino_acids <- c(s1t2$`Weight (Da)`)
print(weights_of_amino_acids)

letters_with_weights <- c('A' = 89.09, 
                          'R' = 174.20, 
                          'N' = 132.12,
                          'D' = 133.10,
                          'C' = 121.15,
                          'E' = 147.13,
                          'Q' = 146.15,
                          'G' = 75.07,
                          'H' = 155.16,
                          'I' = 131.18,
                          'L' = 131.18,
                          'K' = 146.19,
                          'M' = 149.21,
                          'F' = 165.19,
                          'P' = 115.13,
                          'S' = 105.09,
                          'T' = 119.12,
                          'W' = 204.23,
                          'Y' = 181.19,
                          'V' = 117.15
)

user_name = readline(prompt = 'Enter your name in UPPERCASE letters here: ') 
name_letters <- c(strsplit(user_name, split = '') [[1]])

total_moluclar_weight <- 0

for (l in amino_acid_letters) {
   total_moluclar_weight <- total_moluclar_weight + letters_with_weights[[l]]
}

mol_wt_in_kdals <- (total_moluclar_weight/1000)
print(mol_wt_in_kdals)

Prot_wt_in_kdals <- function(protein = user_name) {
  user_name = readline(prompt = 'Enter your name in UPPERCASE letters here: ') 
  name_letters <- c(strsplit(user_name, split = '') [[1]])
  total_moluclar_weight <- 0
  for (l in amino_acid_letters) {
    total_moluclar_weight <- total_moluclar_weight + letters_with_weights[[l]]
  }
  print(total_moluclar_weight)
  mol_wt_in_kdals <- (total_moluclar_weight/1000)
  return(mol_wt_in_kdals)
}

Protein_in_kilDal(protein = user_name)

