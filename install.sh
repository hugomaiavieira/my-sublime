#!/usr/bin/env bash
#
# This script just complement the Sublime Text installation and expect that it
# is already installed.
# Sublime Text can be downloaded on http://www.sublimetext.com/2
#
# ------------------------------------------------------------------------------
#
# The MIT License
#
# Copyright (c) 2011 Hugo Henriques Maia Vieira
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# ------------------------------------------------------------------------------
#

# Black magic to get the folder where the script is running
FOLDER=$(cd $(dirname $0); pwd -P)

SUBLIME_EXEC=$(locate sublime_text)
CONFIG_DIR="$HOME/.config/sublime-text-2"

# install system dependencie to fix 'no module_path: "pixmap"' warning
sudo apt-get install -y gtk2-engines-pixbuf

# create the link
cd /usr/local/bin
sudo ln -s "$SUBLIME_EXEC" sublime

# add icon
sudo cp $FOLDER/sublime.png /usr/share/pixmaps
sudo cp $FOLDER/sublime.desktop /usr/share/applications

# copy packages
cp -r $FOLDER/Packages $CONFIG_DIR/Packages

# set as default text editor
sudo sed -i s,gedit,sublime, /etc/gnome/defaults.list
