# vim-ide

# Install vim-ide
git clone --recurse-submodules https://github.com/nuccleon/vim-ide.git
## .. for current user
./vim-ide/install.sh
## .. for dedicated users
./vim-ide/install.sh usr1 usr2
## .. for all users
./vim-ide/install.sh --all

# Install/Update plugins
:PackUpdate
:helptags ALL

# Clean plugins
:PackClean

