csv-uploader
===================

This repository serves as an example repository for potential interfaces for uploading data
into a shiny app.

# app 1

A landing upload screen that allows 2 files to be uploaded. Suitable if you need to upload, for example, real and simulated data to compare results of send into a VPC function etc.

The app leverages `PKPDmisc`, which can be installed via `devtools::install_github("dpastoor/PKPDmisc")` to give much faster reading of larger data via `read_table`. For example, reading in a 20 mb file with read.csv can take 5-15 seconds, but will be less than 1 second with read_table.

A basic screenshot looks like so:

![app1v1](img/app1v1.png)