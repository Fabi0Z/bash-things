# bash-things

A collection of .bashrc setups and bash functions/scripts I often use for configuring and managing my machines (for both Arch Linux and macOS)

## Installing

Just run one of these two commands from your home directory, the first one use **curl** and the othe **wget**. The script will automatically find your Operating System and install the right things.

*curl*

``` bash
curl -o install.sh https://gitlab.com/eathtespagheti/bash-things/raw/master/install.sh && chmod +x install.sh && ./install.sh && rm install.sh
```

*wget*

``` bash
wget -q https://gitlab.com/eathtespagheti/bash-things/raw/master/install.sh && chmod +x install.sh && ./install.sh && rm install.sh
```

## Updating

You can update bash-things with the update script found in `scripts/bash-things-update.sh` or just using the alias `bash-things-update`

## trueline

I'm using trueline by petobens on GitHub, for setting it up check [his project](https://github.com/petobens/trueline)

## pure

I'm using pure by @sindresorhus on GitHub, for setting it up check [his project](https://github.com/sindresorhus/pure)
