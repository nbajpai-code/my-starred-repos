sudo rm -rf /Applications/Xcode.app && \
sudo mv ~/Downloads/Xcode.app /Applications/Xcode.app && \
sudo xcode-select --switch /Applications/Xcode.app && \
xcodebuild -version
