D3 JavaScript Network Graphs from R
===================================


`nd3` is a substitute for the `NetworkD3` package. The reason for its existence is the fact that several bugs in the `NetworkD3` package cause the javascript on which it relies to interact poorly with the javascript of some shiny html widgets. These bugs are documented below:

- https://github.com/christophergandrud/networkD3/issues/214
- https://github.com/christophergandrud/networkD3/issues/216
- https://github.com/christophergandrud/networkD3/issues/145

There are apparently ongoing efforts to fix this:
- https://github.com/christophergandrud/networkD3/pull/215

However, as of 2018-01-11, it has not been fixed. Hence, `nd3`.