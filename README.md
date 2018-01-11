D3 JavaScript Network Graphs from R
===================================

Development version: 0.4.9000 [![CRAN
Version](http://www.r-pkg.org/badges/version/networkD3)](https://CRAN.R-project.org/package=networkD3)
[![Build
Status](https://travis-ci.org/christophergandrud/networkD3.svg?branch=master)](https://travis-ci.org/christophergandrud/networkD3)
![CRAN Monthly
Downloads](http://cranlogs.r-pkg.org/badges/last-month/networkD3) ![CRAN
Total Downloads](http://cranlogs.r-pkg.org/badges/grand-total/networkD3)

`nd3` is a substitute for the `NetworkD3` package. The reason for its existence is the fact that several bugs in the `NetworkD3` package cause the javascript on which it relies to interact poorly with the javascript of some shiny html widgets. These bugs are documented below:

- https://github.com/christophergandrud/networkD3/issues/214
- https://github.com/christophergandrud/networkD3/issues/216
- https://github.com/christophergandrud/networkD3/issues/145

There are apparently ongoing efforts to fix this:
- https://github.com/christophergandrud/networkD3/pull/215

However, as of 2018-01-11, it has not been fixed. Hence, `nd3`.