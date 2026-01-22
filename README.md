# unobtrusive-relnums.nvim

**unobtrusive-relnums.nvim** is a Neovim plugin that adds unobtrusive relative line numbers to the sign column.

I wrote this plugin for a very specific reason:

I **don't like** how the default relative line numbers look,  
but I **don't hate** the idea of them.

More specifically, I dont' like how visually busy they are by constantly shifting around the current line number. I also don't like how it obscures the exact line numbers.

## Installation (lazy.nvim)

```lua
return {
    "stikypiston/unobtrusive-relnums.nvim",
    config = function() require("unobtrusive-relnums").setup() end
}
```
