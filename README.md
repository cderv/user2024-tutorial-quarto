# Tutorial: Get Started with Quarto - useR 2024 - Salzburg


This repository contains the source code of the website used for the
tutorial resources, available at
https://cderv.github.io/tuto-quarto-user-2024/

## To be ready and do the exercises

Setting up your environment:

- Download and install the latest versions of R, RStudio and Quarto:

  - A recent version of R (4.4 or higher):

  - The latest version of RStudio (`2024.04.2-764` or higher):

  - The latest version of Quarto `1.5` available at
    <https://quarto.org/docs/download/>

- Install the following packages:

  ``` r
  # For the exercises (dplyr and ggplot2 should be sufficient if you don't want the entire tidyverse)
  pkg_list <- c("rmarkdown", "palmerpenguins", "gt", "tidyverse") 
  # R base
  install.packages(pkg_list)
  # or using pak
  pak::pkg_install(pkg_list)
  ```

If you prefer to have the files locally in advance:

- Download [`exercises.zip`](exercises.zip). This compressed folder
  contains various resources that may be useful for the exercises. Unzip
  it on your desktop or in a location that you can easily locate on your
  computer. You will be able to simply copy and paste the files you need
  throughout the tutorial.

- Download [`correction-exemples.zip`](correction-exemples.zip). **This
  is the equivalent of exercise solutions - Do not look in advance if
  you really want to practice on the day**. This compressed folder
  contains various resources used as examples and demonstrations. Unzip
  it on your desktop or in a location that you can easily locate on your
  computer. You will be able to simply copy and paste the files you need
  throughout the tutorial.

## Licence

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
