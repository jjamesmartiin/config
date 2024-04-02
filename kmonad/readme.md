# This is the readme for kmonad
### Prerequisites
#### nixos
- download the haskell packages for kmonad
- clone the kmonad repo
- install with `nix build nix --extra-experimental-features 
  1 nix-command --extra-experimental-features flakes`
- in order to get it working without needing sudo I had to run `sudo chmod 0666 /dev/uinput` (read https://github.com/kmonad/kmonad/blob/master/doc/installation.md#nixos for more)


### Procedure for windows
- install scoop
- I followed this script from https://github.com/kmonad/kmonad/blob/master/doc/installation.md#windows-environment

```
   # set required privileges to run scripts (required for scoop installer)
   Set-ExecutionPolicy RemoteSigned -scope CurrentUser

   # install scoop (no admin rights required)
   iwr -useb get.scoop.sh | iex

   # install stack
   scoop install stack

   # clone the KMonad repository (assuming you have `git` installed)
   cd $HOME\Downloads
   git clone https://github.com/kmonad/kmonad.git
   cd kmonad

   # compile KMonad (this will first download GHC and msys2, it takes a while)
   stack build

   # the new kmonad.exe will be in .\.stack-work\install\xxxxxxx\bin\
   
   # install kmonad.exe (copies kmonad.exe to %APPDATA%\local\bin\)
   stack install
   
   # run kmonad.exe
   kmonad.exe .\path\to\config.kbd
```
