# Install Xcode Commad line tools
xcode-select --install
if [ !$? ]; then return; fi;

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if [ !$? ]; then return; fi;

# sudo pip3 install --upgrade setuptools
# if [ !$? ]; then return; fi;
#
# sudo pip3 install --upgrade pip
# if [ !$? ]; then return; fi;
#
# pip3 install virtualenv
# if [ !$? ]; then return; fi;
