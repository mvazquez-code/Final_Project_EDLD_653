# STANDARD ERROR
std <- function(x) sd(x)/sqrt(length(x))

# SUMMARY FUNCTION
get_descrip <- function(dat, var1){
  dat %>% summarize(n = n(),
                    mean = mean(var1, na.rm = TRUE), 
                    sd = sd(var1, na.rm = TRUE),
                    median = median(var1, na.rm = TRUE),
                    min = min(var1, na.rm = TRUE),
                    max = max(var1, na.rm = TRUE))
}

# SUMMARY FUNCTION by GROUP
group_means <- function(data, outcome, ...) {
  out <- enquo(outcome)
  
  data %>%
    group_by(...) %>%
    summarize(Mean = mean(!!out, na.rm = TRUE),
              SD = sd(!!out, na.rm = TRUE),
              Min = min(!!out, na.rm = TRUE),
              Max = max(!!out, na.rm = TRUE)
    )
}  

# KABLE STYLING
kable_style <- function(data){
  
  data <- as_tibble(data)
  
  kable(data, digits = 2, align = "c") %>% 
    kable_styling(bootstrap_options = c("striped"),
                  full_width = FALSE) %>% 
    row_spec(0, background = "gray", color = "white")  
  
}

# BARPLOT THEME
bp_theme <- function(...) {
  theme_minimal(...) +
    theme(panel.grid.major.y = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.x = element_line(color = "gray80"),
          plot.title.position = "plot")
}
