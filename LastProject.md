What Is The Fuel Performance Of Your Car?
========================================================
transition: rotate 
![alt text](Cars2.png)   
<small>
Author: Isabelle Valette    
Date: April 25th, 2015     
Course: Developing Data Products   
Data Science Specialization on Coursera    
</small>

Executive Summary
========================================================
transition: rotate
Use the inputs on the left-hand side of the [Shiny App](https://ivalette.shinyapps.io/LastProject/) to calculate the fuel economy performance of your car measured in Miles per gallon (MPG).

- The **Data** and **EDA** tabs will give you a feeling of what the data foundation looks like and what are the potential issues with the linear regression model used.
- The **Car Specifications** tab shows you a summary of the specifications you selected.
- The **Fuel Performance** tab shows you how well your car is performing.


Taking a quick look at the data
========================================================
transition: rotate 
We will use a standard dataset from r for calculating your car fuel performance.The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).



```r
data(matcars); head(mtcars[,c(1:4,6,9 )])
```

```
                   mpg cyl disp  hp    wt am
Mazda RX4         21.0   6  160 110 2.620  1
Mazda RX4 Wag     21.0   6  160 110 2.875  1
Datsun 710        22.8   4  108  93 2.320  1
Hornet 4 Drive    21.4   6  258 110 3.215  0
Hornet Sportabout 18.7   8  360 175 3.440  0
Valiant           18.1   6  225 105 3.460  0
```


Using Linear Regression
========================================================
transition: rotate

The calculation performed by the Shiny App are the results of the following regression model. 

```
fit <- lm (mpg ~ cyl + am + wt + disp + hp, data=mpgData)
```
We have listed for you the coefficients from the linear regression model used in Shiny.

```
                Estimate Std. Error
(Intercept)  38.20279869 3.66909647
cyl          -1.10637984 0.67635506
am1 - Manual  1.55649163 1.44053603
wt           -3.30262301 1.13364263
disp          0.01225708 0.01170645
hp           -0.02796002 0.01392172
```

Final Notes
========================================================
transition: rotate 



- Link to my [Shiny App](https://ivalette.shinyapps.io/LastProject/)
- Link to my files on [Github](https://github.com/ivalette/Last-project)

Note: The linear model used in our example is for recreational use only and does not statisfy the strict assumptions required in building a linear statistical model. 

The project concludes the last of the courses from the data science specialization on Coursera.    

For more details on authoring R presentations, please view the following [tutorials](https://support.rstudio.com/hc/en-us/sections/200130218-R-Presentations) from RStudio.
