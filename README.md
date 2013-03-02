# highChaRRRts
============

An R package to create interactive HighCharts in JavaScript from a dataframe. You'll want to use dcast in the reshape2 package to format it nicely. (more on that: [http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/](http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/))

Currently supported chart types: bar, line, area, column.<br/>
Chart types to come: scatterplot and others

## Usage

```
	highChaRRRts(data, chart_type, x_axis_label, y_axis_label)
```

## So...

```
	highChaRRRts(df, "line", "Months", "Temperature")
```