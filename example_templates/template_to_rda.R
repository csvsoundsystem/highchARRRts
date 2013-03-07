categorical_template <- readChar("example_templates/prd/categorical_template.html", nchars=100000000)
save(categorical_template, file="data/categorical_template.rda")

scatter_template <- readChar("example_templates/prd/scatter_template.html", nchars=100000000)
save(scatter_template, file="data/scatter_template.rda")

date_template <- readChar("example_templates/prd/date_template.html", nchars=100000000)
save(date_template, file="data/date_template.rda")

moment_js <- readChar("example_templates/libs/moment.min.js", nchars=100000000)
save(moment_js, file="data/moment_js.rda")
