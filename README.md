# Instructions for setting up home-manager 
## Install nix
- [nix](https://nixos.org/download/)
```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## Clone repo and run
```
mkdir -p ~/gitprojects && cd ~/gitprojects && git clone git@github.com:jjamesmartiin/config.git
cd config/ && nix-shell --run "home-manager switch -b backup"
```

