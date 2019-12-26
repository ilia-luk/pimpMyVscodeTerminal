# pimp my terminal

version: 0.2.1

## main goal is to pretify macs default terminal.app and turn vscode internal terminal into a predefined tmux session
![terminal example](http://res.cloudinary.com/domusnetwork/image/upload/v1504856413/Screenshot_2017-09-08_10.35.54.png)
![vscode example](http://res.cloudinary.com/domusnetwork/image/upload/v1504856690/Screenshot_2017-09-08_10.43.47_2.png)

### Install Homebrew

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install rest of packages

```shell
brew install wget

brew install git

brew install zsh

brew install tmux

brew install z

brew install htop

brew install nodenv

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### .zshrc, .tmux.conf and start.sh configurations and init script

copy included `.zshrc`, `.tmux.conf`, `code-shell` and `tmux.dev.sh` files to `~/`.

- ``` mv .zshrc ~/.zshrc ```

- ``` mv .tmux.conf ~/.tmux.conf ```

- ``` mv code-shell ~/code-shell ```

- ``` mv tmux.dev.sh ~/tmux.dev.sh ```

### make code-shell and tmux.dev.sh executables

- lets make our code-shell script executable by running: `chmod +x ~/code-shell`

- lets make our tmux.dev.sh script executable by running: `chmod +x ~/tmux.dev.sh`

### .Powerline font

 - included is my favorite Meslo powerLine font, you can find [other Fonts here](https://github.com/powerline/fonts)

 - install whichever one on your system

### terminal.app

first we need to change some settings in our terminal.app, set whichever font you chose earlier to serve as your default font in the terminal.app:

- In Preferences > Profiles > Add new profile by pressing the cog at the bottom left corner, from the drop down select import and chose the included smyck.terminal file.

- Look for 'Font' and press 'change' near it, you can change the default font to a powerline font like the included `Meslo LG M DZ Regular for Powerline`, dont forget to chose `regularForPowerline` typeface and change size to `12`

- In Preferences > General > Look for 'Shell opens with', select 'Command' and paste `/bin/zsh`

- In Preferences > General > Add your profile as the default profile by selecting 'On startup open new window with profile' and select `smyck`.

### vscode internal terminal

we can configure vscode internal terminal to use powerline font by:

- In Preferences > Settings > Add the following line if you used Meslo included font, otherwise change the font name to be exactly as it shows in your fontBook.app: `"terminal.integrated.fontFamily": "Meslo LG M DZ for Powerline"`

- In Preferences > Settings > Add the following lines:
  - `"terminal.integrated.shell.osx": "/Users/{{YOUR_USERNAME}}/code-shell",`
  - `"terminal.integrated.shellArgs.osx": ["-l"]`

 - restart vscode and open internal terminal by pressing <kbd>ctrl</kbd> + <kbd>~</kbd>

 - uncomment last line from ```~/.tmux.conf```

### vscode settings file

if you're too lazy to configure vscode you can just paste the included 'settings.json' file and copy it to: `~/Library/Application Support/Code/User/settings.json`
