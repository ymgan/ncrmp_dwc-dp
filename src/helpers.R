library(tidyverse)
library(jsonlite)

# Function to filter a dataframe based on field names from a JSON file
filter_dataframe_by_json <- function(df, json_url) {
  # Read JSON from the URL
  json_data <- fromJSON(json_url)
  
  # Extract field names safely
  field_names <- json_data$fields$name %>% na.omit() %>% unique()
  
  # Filter the dataframe to keep only matching columns
  filtered_df <- df %>% select(any_of(field_names))
  
  return(filtered_df)
}