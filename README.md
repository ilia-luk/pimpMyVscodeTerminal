# pimp my terminal

version: 0.3.1 (supports tmux 3.1c)

## main goal is to pretify macs default terminal.app and turn vscode internal terminal into a predefined tmux session

This is a WIP, feel free to send PR's and make it better

---

![terminal example](http://res.cloudinary.com/domusnetwork/image/upload/v1504856413/Screenshot_2017-09-08_10.35.54.png)
![vscode example](http://res.cloudinary.com/domusnetwork/image/upload/v1504856690/Screenshot_2017-09-08_10.43.47_2.png)

### Install Homebrew

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install rest of packages

run the following lines one by one:

```shell
brew install wget

brew install git

brew install zsh

brew install tmux

brew install z

brew install htop

brew install thefuck

brew install nodenv

nodenv install ${NODE_VERSION}

nodenv global ${NODE_VERSION}

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

```

### .zshrc, .tmux.conf and start.sh configurations and init script

clone or download this repository and browse from your terminal to it,
next we need to copy included `.zshrc`, `.tmux.conf`, `code-shell`, and `tmux.dev.sh` files to `~/` (home directory)
by running the following commands:

- `mv .zshrc ~/.zshrc`
- `mv .tmux.conf ~/.tmux.conf`
- `mv code-shell ~/code-shell`
- `mv tmux.dev.sh ~/tmux.dev.sh`

### make code-shell and tmux.dev.sh executables

- lets make our code-shell script executable by running: `chmod +x ~/code-shell`
- lets make our tmux.dev.sh script executable by running: `chmod +x ~/tmux.dev.sh`

### .Powerline font

- included is my favorite Meslo powerLine font, you can find [other Fonts here](https://github.com/powerline/fonts)
- install whichever one on your system or use the provided Meslo from this repository.

### terminal.app

first we need to change some settings in our terminal.app, set whichever font you chose earlier to serve as your default font in the terminal.app and install the color scheme, in order to do so follow this steps:

- In Preferences > Profiles > Add new profile by pressing the cog at the bottom left corner, from the drop down select import and chose the included `smyck.terminal` file.

- select it from the above list, press the cog again and select `Duplicate profile`.

- give it a `{{CUSTOM_PROFILE_NAME}}` and make sure it's selected, then press `Default` from the bottom menu near the cog.

- On the right settings pane, look for the `Text` tab and under `Font` section press `change`, you can change the default font to a powerline font like the included `Meslo LG M DZ Regular for Powerline`, dont forget to chose `regularForPowerline` typeface and change size to `12`

- In Preferences > General > Look for `Shell opens with`, select `Command` and paste `/bin/zsh`

- In Preferences > General > Add your profile as the default profile by selecting `On startup open new window with profile` and select `{{CUSTOM_PROFILE_NAME}}`.

- In View > "Allow mouse reporting", uncheck it to allow temorarly copy/paste to clipbord.

### vscode internal terminal

In Preferences > Settings > Add the following lines (dont forget to change {{YOUR_USERNAME}} to your machine username and to name the font exactly as it shows in your fontBook.app):

- `"terminal.integrated.shell.osx": "/Users/{{YOUR_USERNAME}}/code-shell"`
- `"terminal.integrated.shellArgs.osx": ["-l"]`
- `"terminal.integrated.fontFamily": "Meslo LG M DZ for Powerline"`

if you're too lazy to configure vscode you can just paste the included `settings.json` file and copy it to: `~/Library/Application Support/Code/User/settings.json`

- restart vscode and open internal terminal by pressing <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>~</kbd>
