#!/usr/bin/env bash

pyron() {
    # Default configuration
    VENV_NAME=".pyron"
    MIN_PYTHON_VERSION="3.7"

    # Function to compare version numbers
    version_compare() {
        printf '%s\n' "$1" "$2" | sort -V | head -n 1
    }

    # Function to check if we're in zsh
    is_zsh() {
        [ -n "$ZSH_VERSION" ]
    }

    # Function to get the appropriate activate script
    get_activate_script() {
        if is_zsh; then
            echo "source \"$VENV_NAME/bin/activate\""
        else
            echo ". \"$VENV_NAME/bin/activate\""
        fi
    }

    # Check if Python 3 is available
    if ! command -v python3 >/dev/null 2>&1; then
        echo "Error: Python 3 is not installed or not in PATH" >&2
        return 1
    fi

    # Check Python version
    PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    if [ "$(version_compare "$PYTHON_VERSION" "$MIN_PYTHON_VERSION")" = "$PYTHON_VERSION" ]; then
        echo "Error: Python $MIN_PYTHON_VERSION or higher is required (found $PYTHON_VERSION)" >&2
        return 1
    fi

    # Create or activate the virtual environment
    if [ ! -d "$VENV_NAME" ]; then
        echo "Creating new virtual environment '$VENV_NAME'..."
        python3 -m venv "$VENV_NAME" || {
            echo "Error: Failed to create virtual environment" >&2
            return 1
        }
        eval "$(get_activate_script)" || {
            echo "Error: Failed to activate virtual environment" >&2
            return 1
        }
        pip install --upgrade pip || {
            echo "Error: Failed to upgrade pip" >&2
            return 1
        }
        echo "Virtual environment created and activated successfully!"
    else
        echo "Found existing virtual environment '$VENV_NAME'"
        eval "$(get_activate_script)" || {
            echo "Error: Failed to activate virtual environment" >&2
            return 1
        }
        echo "Virtual environment activated successfully!"
    fi

    # Display environment information
    echo "Using Python: $(python --version)"
    echo "Using pip: $(pip --version)"
    echo "Environment location: $(which python)"
}

# Make the function available in the current shell
# No need for export -f as sourcing the script makes the function available
