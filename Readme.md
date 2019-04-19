# dotfiles

Setup Mac OS.

## First of all

```bash
$ xcode-select --install
```

## Checkout

```bash
$ cd
$ git clone https://github.com/yukihira1992/dotfiles.git
```

## Install

```bash
$ cd ~/dotfiles
$ ./install.sh
```

## Fish shell

### Change fish as login shell
```bash
$ FISH_PATH=`which fish`
$ sudo sh -c "echo $FISH_PATH >> /etc/shells"
$ chsh -s $FISH_PATH
```

### Change fish color

```bash
$ fish_config
```

![fish_config](./img/fish_config.png)

Select theme and click "Set Theme" Button.

## Terminal

Start Terminal.app

Select "Terminal" -> "Preferences" -> "Profile".

![terminal_profile](./img/terminal_profile.png)

### Change transparency

Click "Color and Effect".

![terminal_background_color](./img/terminal_background_color.png)

### Change font

Click "Font"

![terminal_font](./img/terminal_font.png)

Select "Family"

![terminal_font_family](./img/terminal_font_family.png)

Select "Source Code Pro for Powerline"

