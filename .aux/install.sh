#!/bin/bash

# VIMEZ INSTALL
###############

clear

# Backup any remnants of an existing Vim install.
cd ~
mkdir -p ~/backup/vimez/
for i in .vimrc .gvimrc .vim
  do [ -e $i ] && /bin/mv -fb $i backup/vimez/$i.vimez.bak
done
echo -e "\nBackedup existing Vim install successfully!\n"
#------------------------------------------------------------------------------



# Clone VimEz
#rm -rf ~/.vim
git clone git://github.com/VimEz/VimEz.git ~/.vim
echo -e "\nCloned VimEz successfully!\n"
#------------------------------------------------------------------------------



# Link to vimrc and gvimrc configuration files.
cd ~
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc
echo -e "\nLinked to configuration files successfully!\n"
#------------------------------------------------------------------------------



# Clone Vundle and install plugin/bundles.
git clone http://github.com/VimEz/Vundle.git ~/.vim/bundle/Vundle
vim -u ~/.vim/initrc +BundleInstall +q
echo -e "\nPlugin bundles installed successfully!\n"
#------------------------------------------------------------------------------



# Install Command-T C extension.
echo -e "\n"
rvm use system
echo -e "\n"
cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
cd
echo -e "\nCompiled Command-T C extension successfully!\n"
#------------------------------------------------------------------------------



# Create local directory.
/bin/mkdir -p ~/.vim.local/sessions/
/bin/mkdir -p ~/.vim.local/spell/
/bin/mkdir -p ~/.vim.local/tmp/backups/
/bin/mkdir -p ~/.vim.local/tmp/swaps/
/bin/mkdir -p ~/.vim.local/tmp/undos/
#------------------------------------------------------------------------------



# Create files.
touch ~/.vim.local/spell/en.utf-8.add
/bin/cp -f ~/.vim/.aux/initrc.local.example ~/.vim.local/
/bin/cp -f ~/.vim/.aux/vimrc.local.example ~/.vim.local/
/bin/cp -f ~/.vim/.aux/gvimrc.local.example ~/.vim.local/
#------------------------------------------------------------------------------



# Checkout plugin versions.
#mv ~/.vim/bundle/ConqueShell/doc/tags ~/.vim.local/tmp/
#cd ~/.vim/bundle/ConqueShell/; git checkout 2.0; cd ~/.vim
#mv ~/.vim.local/tmp/tags ~/.vim/bundle/ConqueShell/doc/
#------------------------------------------------------------------------------



# Clean up.
rm ~/install.sh
echo -e "\nCleaned up successfully!\n"
#------------------------------------------------------------------------------
