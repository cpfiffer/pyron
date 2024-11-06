# pyron

![less hateful pip](less-hateful-pip.png)

Manage virtual python environments with ease.

Creates and activates a `.pyron` virtual environment in your current directory.

## Features

- Automatically creates or activates a `.pyron` virtual environment
- Works in both bash and zsh
- Performs Python version checks
- Updates pip to latest version on environment creation
- Provides clear feedback and error messages

## Installation

### Option 1: Direct install (recommended)
```bash
curl -o- https://raw.githubusercontent.com/cpfiffer/pyron/main/install.sh | bash
```
Or with wget:
```bash
wget -qO- https://raw.githubusercontent.com/cpfiffer/pyron/main/install.sh | bash
```

### Option 2: Manual Installation

1. Download the script:
```bash
mkdir -p ~/.local/bin
curl -o ~/.local/bin/pyron.sh https://raw.githubusercontent.com/cpfiffer/pyron/main/pyron.sh
<<<<<<< HEAD
chmod +x ~/.local/bin/pyron.sh
=======
>>>>>>> a5b05d7e379884ca44761da4a0241bc9c427aab9
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

### Option 3: Using git

```bash
git clone https://github.com/cpfiffer/pyron.git
cd pyron
chmod +x install.sh
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
- `bash` or `zsh` shell

## License

MIT License - see LICENSE file for details

## Security

The install script will:
- Create `~/.local/bin` if it doesn't exist
- Copy `pyron.sh` to `~/.local/bin`
- Add a source line to your `.zshrc` and/or `.bashrc`
- No sudo privileges required
