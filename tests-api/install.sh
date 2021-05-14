#!/bin/sh
. ./scripts/installation_scripts/platform_validation.sh
echo "Installing and configuring virtual env using pipenv"
pip install pipenv
pipenv install --skip-lock -r requirements.txt

pipenv run python -m pytest -v --base-url https://api.github.com --tags="automated"
