# ## Exercise 2
# 
# In RStudio on Posit Cloud, create a new R script, load the tidyverse, and import the data. 
# Then, using the `|>` in consecutive lines of code, find the customers who have spent the most 
# recently by doing the following.
# 
# 1. Join the `customer_data` and `store_transactions` data.
# 2. Only keep customers in the `South`.
# 3. Create a new variable `age` using `2023 - birth_year`.
# 4. Only keep the variables `age`, `gender`, `income`, `credit`, `married`, `college_degree`, `region`, and `dec_2018`.
# 5. Arrange the data in descending order based on `dec_2018` transactions.
# 6. Keep the top 3 rows of data.
# 7. Who appears to be purchasing the most items for this month in the South?
# 8. Export the R script and upload to Canvas.

# Five points total, one point each for:
#   
# - Loading the tidyverse.
# - Importing customer_data and store_transactions.
# - Following the instructions using consecutive lines of code.
# - Making a reasonable attempt to follow all of the steps and answer the question.
# - Submitting an R script.

# Load packages.
library(tidyverse)

# Import data.
customer_data <- read_csv("customer_data.csv")
store_transactions <- read_csv("store_transactions.csv")

# Find the customers who have spent the most recently.
customer_data |> 
  left_join(store_transactions, join_by(customer_id)) |> 
  filter(region == "South") |> 
  mutate(age = 2024 - birth_year) |> 
  select(age, gender:region, dec_2018) |> 
  arrange(desc(dec_2018)) |> 
  slice(1:3)

# Customers in the South who purchased the most in December 2018 appear to be
# mostly married with college degrees. However, we need a better way to summarize
# data to better detect any patterns or relationships between variables.

