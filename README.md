# PDFGen

Generate a pdf that contains series of images from a folder.

## Usage

1. Place all the images you want in the pdf in a folder
2. Name the folder what you want the name of the pdf to be
3. Run the script, specifying necessary parameters

## Script

The script takes two arguments

- --dir -> the directory to pull the images from
- --ext -> the file extension to filter for
  
Exact usage can be seen by running the script with '--help' or '-h'

## Installation

This script was created for OSX and has only been tested on OSX.
Use on other platforms at your own risk.

1. Download most recent release [here][https://github.com/jacob-abraham/PDFGen/releases/download/1.0/pdfgen]
2. Open a command prompt and make the file executable (`chmod +x pdfgen`)
3. If `~/bin` does not exist, create it (`mkdir ~/bin`)
4. Move `pdfgen` to bin (`mv pdfgen ~/bin/pdfgen`)
5. On OSX, if using zsh open `~/.zshrc` or if on bash open `~/.bash_profile`. If on another shell use the appropriate file
6. Add the following line to the file `export PATH=$PATH:~/bin`
7. Save the file and relaunch the shell
