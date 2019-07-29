pagedown::chrome_print("presentation/WinterSchool_2019_Brisbane_slides.html")

---
  # Visualisations by `singscore`
  
  
  ```{r, echo=FALSE, fig.align="center", out.width = '70%', fig.cap =""}
knitr::include_graphics("./images/RankDensity.png") 
```
--
  ```{r, echo=FALSE, fig.align="center", out.width = '70%',  fig.cap =""}
knitr::include_graphics("./images/ScoreDispersion.png") 
```
<small>[Using singscore to predict mutations in AML from transcriptomic signatures. Bhuva D. et al. *f1000 research*](https://bioconductor.org/packages/release//workflows/vignettes/SingscoreAMLMutations/inst/doc/workflow_transcriptional_mut_sig.html).</small>
  
  ---
  # Visualisations by `singscore`
  
  ```{r, echo=FALSE, fig.align="center", out.width = '50%', fig.cap =""}
knitr::include_graphics("./images/ScoreLandscape.png") 
```
<small>[Using singscore to predict mutations in AML from transcriptomic signatures. Bhuva D. et al. *f1000 research*](https://bioconductor.org/packages/release//workflows/vignettes/SingscoreAMLMutations/inst/doc/workflow_transcriptional_mut_sig.html).</small>
  
  
  
  
  
  
  
  
  getColorScale <- function(annot) {
    #specify a discrete scale for categoricals
    if (is.factor(annot)) {
      #specify a discrete scale for categoricals
      if (length(levels(annot)) > 8) {
        warning('Too many levels of the annotation, using default ggplot2 colours')
        return(NULL)
      } else{
        return(ggplot2::scale_colour_brewer(palette = 'Dark2'))
      }
    }
    
    #specify a continous scale for numerics
    if (is.numeric(annot)) {
      return(ggplot2::scale_colour_viridis_c())
    }
    
    return(NULL)
  }


```{r}
p <- plot_ly(sigScore_epi, x = ~ TotalScore, y = ~ TotalDispersion,
  color = ~ colData(tgfb_expr_10_se)$Treatment)
p
```



---
  # R Notebook
  
  An [**R Notebook**](https://bookdown.org/yihui/rmarkdown/notebook.html#fig:notebook-demo) is an R Markdown document with chunks that can be executed independently and interactively, with output visible immediately beneath the input.
    - **R Markdown**: executes and evaluates all code in one go. It can be very time-consuming when we have heavy processing
    - **R Notebook**: has caching behaviour; it evaluates a code chunk and save it. 
    
    "The immediacy of notebook mode makes it a good choice while authoring the R Markdown document and iterating on code. When you are ready to publish the document, you can share the notebook directly, or render it to a publication format with the Knit button."
    
    ---
      # R Markdown and R Notebook
      .pull-left[
        - [R Markdown](https://rmarkdown.rstudio.com)
        + **knit** botton
        + output: **html_document**
          
          ```{r, echo=FALSE, fig.align="center", out.width = '100%', fig.cap =""}
        knitr::include_graphics("./images/RMarkdown_example.png") 
        ```
        ]
    
    .pull-right[
      - [R Notebook](https://bookdown.org/yihui/rmarkdown/notebook.html) 
      + **preview** botton
      + output: **html_notebook**
        
        ```{r, echo=FALSE, fig.align="center", out.width = '100%', fig.cap =""}
      knitr::include_graphics("./images/Rnotebook_example.png") 
      ```
      ]
    
    
    
    ---
      # How does it look when we knit?
      ```{r, echo=FALSE, fig.align="center", out.width = '90%', fig.cap ="https://github.com/DavisLaboratory/NK_scoring/"}
    knitr::include_graphics("./images/Rendered_RMarkdown.png") 
    ```
   
    
    
    
    
    ### Signature landscape for cell lines
    ```{r generate landscape plot for cell lines,  fig.height = 6, fig.width = 7}
    p1 <- plotScoreLandscape(
      scoredf1 = sigScore_epi,
      scoredf2 = sigScore_mes,
      scorenames = c("Epithelial", "Mesenchymal")
    )
    
    projectScoreLandscape(
      plotObj = p1,
      scoredf1 = sigScore_epi,
      scoredf2 = sigScore_mes,
      annot = colData(tgfb_expr_10_se)$Treatment,
      annot_name = "Group",
      sampleLabels = colnames(rankedData),
      isInteractive = T
    )
    ``` 
    
