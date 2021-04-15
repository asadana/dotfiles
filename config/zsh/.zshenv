# Should contain PATH and env prefs

# env

# Machine based options
case "$(uname -s)" in
	Linux*)
		machine=Linux
	;;
	Darwin*)
		machine=Darwin
	;;
	# Windows git prompt
	MINGW*)
		machine=MinGw
	;;
	*)
		machine="UNKNOWN:$(uname -s)"
	;;
esac

export DOTFILES_DIR="~/workspace/dotfiles"

# zsh history control
HISTFILE=~/.zsh_history
HISTSIZE=8000
SAVEHIST=8000

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export PYENV_ROOT="$HOME/.pyenv"

# PATH

# local bin
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# toolbox
[ -d "$HOME/.toolbox" ] && export PATH=$HOME/.toolbox/bin:$PATH
# pyenv
[ -d "$PYENV_ROOT" ] && export PATH="$PYENV_ROOT/bin:$PATH"
