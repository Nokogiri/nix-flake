# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded

# gnupghome is only defined in bash? redefine it
#$env.GNUPGHOME = $'($env.XDG_CONFIG_HOME)/gnupg'

$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#   By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#   By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# Add /bin to path
$env.PATH = ($env.PATH | split row (char esep) | prepend '/etc/nixos/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/.emacs.d/bin')

# TODO: incorporate this throughout
$env.EDITOR = 'hx';

$env.GDK_BACKEND = 'wayland';

alias js = joshuto
alias cat = bat
alias e = emacsclient -c
# TODO: is there a better wifi testing tool?
alias ct = ping google.com

alias v = nvim -u ~/.config/nvim/init.lua
alias vi = nvim -u ~/.config/nvim/init.lua
alias vim = nvim -u ~/.config/nvim/init.lua
alias nvim = nvim -u ~/.config/nvim/init.lua

# TODO: Remove once shell aliases are ported to nushell

alias gbc = git checkout (git branch --all | fzf | str replace '(\*)' '' | str trim);
alias gop = git open
alias ga = git add
alias gc = git commit
alias gcm = git commit -m
alias gcl = git clone

alias gap = git add --patch
# need to pass this the commit after `resolve` ...
alias gre = git revert --strategy resolve
alias gb = git branch -av
alias gbl = git blame
alias gca = git commit --amend
alias gcf = git commit --fixup
alias gf = git fetch
alias gi = git init
alias gl = git log --graph --pretty="format:%C(yellow)%h%Creset %C(red)%G?%Creset%C(green)%d%Creset %s %Cblue(%cr) %C(bold blue)<%aN>%Creset"
alias gll = git log --pretty="format:%C(yellow)%h%Creset %C(red)%G?%Creset%C(green)%d%Creset %s %Cblue(%cr) %C(bold blue)<%aN>%Creset"
alias gL = gl --stat
alias gp = git push
alias gpl = git pull --rebase --autostash
alias gs = git status --short .
alias gss = git status
alias gst = git stash
alias gr = git reset HEAD
alias grv = git rev-parse

