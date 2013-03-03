<center>![highChaRRRt s](imgs/pirate.png)</center>
##generate interactive plots in AAAARRRRRRRR#
============
_[a csv soundsystem joint](http://www.csvsoundsystem.com/)_

<p>An R package to create interactive HighCharts in JavaScript from a dataframe. You'll want to use dcast in the reshape2 package to format it nicely. [More on that...](http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/)</p>

<p>Currently supported chart types: bar, line, area, column.<p>
<p>Chart types to come: scatterplot and others</p>
## Install the package

```
library("devtools")
install_github("highChaRRRts", "csvsoundsystem")
library("highChaRRRts")
```

## Basic usage

```
highChaRRRts(dcasted_df)
```

<p>Then in your console, cd to the directory it just created, default name "chart_output". Then create a simple web server such as</p>
```
python -m SimpleHTTPServer
```
<p>Then point your browser to 0.0.0.0:8000</p>

## All options

```
highChaRRRts(dcasted_df, type, main, xlab, ylab, output, pal)
```

## So...

```
highChaRRRts(dcasted_df, type="line", main="Title of the Chart", xlab="X Label", ylab="Y Label, output="chart_output")
```

## More options
<p>If you have the ColorBrewer package installed, you can pass it a name of the color set you want to use</p>

```
highChaRRRts(dcasted_df, type="line", main="Title of the Chart", xlab="X Label", ylab="Y Label, output="chart_output", pal="RdYlBu")
```
