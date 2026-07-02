-- Change the default ASCII banner/header
return {
  "snacks.nvim",
  lazy = false,
  opts = function(_, opts)
    opts.dashboard = opts.dashboard or {}
    opts.dashboard.preset = opts.dashboard.preset or {}
    opts.dashboard.preset.header = [[
_____________________
< Welcome to LazyVim! >
---------------------
\   ^__^            
 \  (oo)\_______    
    (__)\       )\/\
        ||----w |   
        ||     ||   
]]
    opts.dashboard.preset.header = [[
  (\_/)             
  ( •_•)            
  / >🍪   want code?
]]
  end,
}
