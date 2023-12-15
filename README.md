### m'Dotfiles

I'm using [`chezmoi`](https://www.chezmoi.io/) to handle my dotfile config to make using the *same* dotfiles across linux (arch based is assumed for install) and mac.

#### Installation

- Open a terminal and run
    ```
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply justjcurtis
    ```
    This will get my dotfiles and a temporary install of chezmoi and then run the setup scripts.
    Those scripts will install any tools required by the dotiles and any tools that are part of my general setup.

**if this command is ran on a raspberry pi - that pi will also be set up with the pre-requisites to become a pihole*

#### Whats in it for you ?

- A bunch of aliases I have build up over the past 5 years (use @ your own risk)
- Sweet neovim config using lazy.nvim & kickstart.nvim.
- Hamronious tmux setup using tpm
- fzf + ripgrep integration for neovim & general terminal use
- Scripts with binds for fzf-ing project dirs and help from cht.sh 
- A general sense of wellbeing

