#!/bin/bash

echo "Hello, World!"
command -v vim >/dev/null 2>&1 || sudo apt install vim
command -v git >/dev/null 2>&1 || sudo apt install git
