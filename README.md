# pyron

```
██╗     ███████╗███████╗███████╗                          
██║     ██╔════╝██╔════╝██╔════╝                          
██║     █████╗  ███████╗███████╗                          
██║     ██╔══╝  ╚════██║╚════██║                          
███████╗███████╗███████║███████║                          
╚══════╝╚══════╝╚══════╝╚══════╝                          
                                                          
██╗  ██╗ █████╗ ████████╗███████╗███████╗██╗   ██╗██╗     
██║  ██║██╔══██╗╚══██╔══╝██╔════╝██╔════╝██║   ██║██║     
███████║███████║   ██║   █████╗  █████╗  ██║   ██║██║     
██╔══██║██╔══██║   ██║   ██╔══╝  ██╔══╝  ██║   ██║██║     
██║  ██║██║  ██║   ██║   ███████╗██║     ╚██████╔╝███████╗
╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝      ╚═════╝ ╚══════╝
                                                          
██████╗ ██╗██████╗                                        
██╔══██╗██║██╔══██╗                                       
██████╔╝██║██████╔╝                                       
██╔═══╝ ██║██╔═══╝                                        
██║     ██║██║                                            
╚═╝     ╚═╝╚═╝                                            
```

Manage virtual python environments with ease.

Creates and activates a `.pyron` virtual environment in your current directory.

## Features

- Automatically creates or activates a `.pyron` virtual environment
- Works in both bash and zsh
- Performs Python version checks
- Updates pip to latest version on environment creation
- Provides clear feedback and error messages

## Usage 

## Installation

### Option 1: Manual Installation

1. Download the script:
```bash
mkdir -p ~/.local/bin
curl -o ~/.local/bin/pyron.sh https://raw.githubusercontent.com/YOUR_USERNAME/pyron/main/pyron.sh
```

2. Add to your shell configuration:

For zsh (add to `~/.zshrc`):
```zsh
source ~/.local/bin/pyron.sh
```

For bash (add to `~/.bashrc`):
```bash
source ~/.local/bin/pyron.sh
```

### Option 2: Using git

```bash
git clone https://github.com/YOUR_USERNAME/pyron.git
cd pyron
./install.sh
```

## Usage

Simply run `pyron` in any directory where you want to create or activate a Python virtual environment:

```bash
cd your-project
pyron
python blah-blah-blah.py
```

This will:
1. Create a `.pyron` virtual environment if it doesn't exist
2. Activate the environment
3. Update pip to the latest version (on first creation)
4. Display the Python and pip versions being used

## Requirements

- Python 3.7 or higher
- bash or zsh shell

## License

MIT License - see LICENSE file for details
