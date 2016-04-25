#!/bin/sh
echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'

echo Install and Set San Francisco as System Font
ruby -e "$(curl -fsSL https://raw.github.com/wellsriley/YosemiteSanFranciscoFont/master/install)"
echo Install Homebrew, Postgres, wget and cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew install wget
brew cask install sshfs
#brew install postgresql
#brew install go
brew install node
#brew install ant
brew install ffmpeg
#brew install eigen
#brew install opencv
#npm install -g gitjk
#sudo npm install -g cordova
#npm install phonegap -g

brew tap phinze/cask
brew install brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
#brew cask search
#brew cask uninstall app

# Core Functionality
echo Install Core Apps
brew cask install alfred
brew cask install dropbox
brew cask install little-snitch
brew cask install transmit
brew cask install vlc
brew cask install iterm2
brew install jenv
brew cask install java
brew cask install intellij-idea-ce
brew cask install disk-inventory-x

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package


## get from App Store
#brew cask install evernote
#brew cask install wunderlist
#brew cask install clamxav

# Development
echo Install Dev Apps
brew cask install github
#brew cask install heroku-toolbelt
brew cask install sublime-text
#brew cask install webstorm
#brew cask install pycharm-pro
#brew cask install light-table
brew cask install virtualbox
brew cask install docker
brew cask install vagrant
#brew cask install sourcetree
brew cask install charles
brew cask install easyfind


# Google Slavery
echo Install Google Apps | Chrome not included cause of 1Password Plugin
# brew cask install google-chrome
brew cask install google-drive
brew cask install music-manager
#brew cask install google-earth
#brew cask install chromecast

# Nice to have
echo Install Some additional Apps
brew cask install firefox

brew cask install skype
brew cask install jdownloader
brew cask install lastfm
brew cask install all2mp3
#brew cask install spotify
#brew cask install spotify-notifications
# Link Cask Apps to Alfred
brew cask alfred link

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo "Security: https://objective-see.com/products.html"

