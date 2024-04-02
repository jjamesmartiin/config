# Instructions for setting up home-manager 
## Install nix
- [nix](https://nixos.org/download/)
`sh <(curl -L https://nixos.org/nix/install) --no-daemon`

## Clone repo and run
`cd ~/ && mkdir -p gitprojects && cd gitprojects && git clone git@github.com:jjamesmartiin/personal.git`
`cd ~/gitprojects/config/ && nix-shell --run "home-manager switch -b backup" && cd -`

