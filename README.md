# highChaRRRts
============

An R package to create interactive HighCharts in JavaScript from a dataframe. You'll want to use dcast in the reshape2 package to format it nicely. (more on that: [http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/](http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/))

Currently supported chart types: bar, line, area, column.<br/>
Chart types to come: scatterplot and others

## Basic usage
```
	highChaRRRts(data)
```
## All options
```
	highChaRRRts(data, chart_type, x_axis_label, y_axis_label, output)
```

## So...

```
	highChaRRRts(df, chart_type = "line", x_axis_label = "Months", y_axis_label = "Temperature", output = "chart_folder")
```

## More options
<p>If you have the ColorBrewer package installed, you can pass it a name of the color set you want to use</p>

(.. colors = "")