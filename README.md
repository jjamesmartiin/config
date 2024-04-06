## 1. Install nix
- [nix](https://nixos.org/download/)
```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## 2. Clone repo
```
mkdir -p ~/gitprojects && cd ~/gitprojects && git clone git@github.com:jjamesmartiin/config.git
```

## 3. Run to install home-manager and switch config 
```
cd ~/gitprojects/personal/config/ && nix-shell --run "home-manager switch -b backup"
```

