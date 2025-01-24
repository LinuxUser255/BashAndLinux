#!/usr/bin/env bash

# Model urls
# https://ollama.com/library/codellama
# https://ollama.com/library/starcoder2
# https://ollama.com/library/codegemma
# https://ollama.com/library/deepseek-coder-v2

echo ''
echo 'Select an Ollama Model to run.'
echo ''

# Function to check if model is pulled, pull if not, and then run
check_pull_and_run() {
    local model=$1
    if ! ollama list | grep -q "$model"; then
        echo "Model $model not found. Pulling..."
        ollama pull $model
    else
        echo "Model $model is already pulled."
    fi
    echo "Running $model..."
    ollama run $model
}

# Function to handle model selection
handle_model() {
    case $1 in
        A) check_pull_and_run llama3.1 ;;
        B) check_pull_and_run codellama ;;
        C) check_pull_and_run starcoder2 ;;
        D) check_pull_and_run codegemma ;;
        E) check_pull_and_run deepseek-coder-v2 ;;
        *) echo "Invalid selection" ;;
    esac
}

# Display menu
echo "A: llama3.1"
echo "B: codellama"
echo "C: starcoder2"
echo "D: codegemma"
echo "E: deepseek-coder-v2"
echo ''

# Prompt user for selection
read -p "Enter your choice (A/B/C/D/E): " choice

# Convert to uppercase
choice=$(echo $choice | tr '[:lower:]' '[:upper:]')

# Handle the selected model
handle_model $choice
