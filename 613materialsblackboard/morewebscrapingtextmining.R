# More Webscraping Retrieving data tables from the 
# internet

install.packages("rvest")
library(rvest)
library(tidyverse)
library(dplyr)

# example 1

wikiurl <- read_html(
"https://en.wikipedia.org/wiki/List_of_highest-grossing_films")
datatables <- wikiurl%>%
  html_table(., fill = T)

datatables[[4]] -> dt
dt

# Let's generate more rows
dt%>%
  print(n = 100)
  
# example 2

wikiurl <- read_html(
  "https://worldpopulationreview.com/us-cities")
datatables1 <- wikiurl%>%
  html_table(., fill = T)

datatables1[[1]] -> dt1
dt1

as.data.frame(dt1) -> dtdf
dtdf




# example 3   PLAY BALL !!

wikiurl <- read_html("https://www.mlb.com/stats/2019")
baseballdata2019 <- wikiurl%>%
  html_table(., fill = T)

baseballdata2019[[1]] -> BD2019
BD2019
# Let's print all 25 rows
BD2019%>%
  print(n = 25)

# Let's print the mean number of homeruns hit
mean(BD2019$HRHR)

# Let's find a linear model for number at bats vs home runs
lm(ABAB ~ HH, BD2019)

# Let's change the data table to a data frame

BD2019 <- data.frame(baseballdata2019[[1]])
BD2019

# ( the tibble representation is probably better)

# One more for good luck !!   California Dreaming!!

wikiurl <- read_html(
"https://www.california-demographics.com/cities_by_population")
Californiacities <- wikiurl%>%
  html_table(., fill = T)

Californiacities[[1]] -> ct
ct

# Arrange the cities in alphabetical order and show 
# the first 50 rows

ct%>%
  select(City,Population)%>%
  arrange(City)%>%
  print(n = 50)



# TEXT MINING

text <- c("Because I could not stop for Death -",
          "He kindly stopped for me -",
          "The Carriage held but just Ourselves -",
          "and Immortality")

text



text <-   c("We thus define the tidy text format as being a table",
            "with one-token-per-row. A token is a meaningful unit of text, such as a word",
            "that we are interested in using for analysis, and tokenization is", 
            "the process of splitting text into tokens. This one-token-per-row",
            "structure is in contrast to the ways text is often stored in", 
            "current analyses, perhaps as strings or in a document-term matrix.",
            "For tidy text mining, the token that is stored in each row is",
            "most often a single word, but can also be an n-gram, sentence, or",
            "paragraph. In the tidytext package, we provide functionality to", 
            "tokenize by commonly used units of text like these and convert", 
            "to a one-term-per-row format.")

text



text <- c("No man is an island",
          "Entire of itself",
          "Every man is a piece of the continent",
          "A part of the main.",
          "If a clod be washed away by the sea",
          "Europe is the less.",
          "As well as if a promontory were.",
          "As well as if a manor of thy friend's",
          "Or of thine own were:",
          "Any man's death diminishes me",
          "Because I am involved in mankind",
          "And therefore never send to know for whom the bell tolls;",
          "It tolls for thee.")

text

text <-c("Hold fast to dreams",
         "For if dreams die",
         "Life is a broken-winged bird",
         "That cannot fly.",
         "Hold fast to dreams",
         "For when dreams go",
         "Life is a barren field",
         "Frozen with snow.")
text

library(tidyverse)


library(dplyr)
text_df <- tibble(line = 42:49, text = text)

text_df

library(tidytext)

text_df %>%
  unnest_tokens(word, text) -> dff
dff


library(ggplot2)

dff %>%
  count(word, sort =TRUE) %>% 
  filter(n >= 1) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n, word)) +
  geom_col(fill = "red", color = "blue") +
  labs(y = NULL)



  
