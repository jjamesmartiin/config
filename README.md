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

# Command to run on servers
```
mkdir -p ~/gitprojects && mkdir -p ~/gitprojects/personal/ && cd ~/gitprojects/personal/ && git clone https://github.com/jjamesmartiin/config.git && nix-shell --run "home-manager switch -b backup"
```

- sometimes home-manager doesn't want to install on a newer version of Nix: 
```
sudo mkdir -m 0755 -p /nix/var/nix/{profiles,gcroots}/per-user/$USER
sudo chown -R $USER:nixbld /nix/var/nix/{profiles,gcroots}/per-user/$USER
```


