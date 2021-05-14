#!/bin/sh
. ./scripts/installation_scripts/platform_validation.sh

echo "Installing minumum python packages"
pip install requests
python ./scripts/installation_scripts/install.py

echo "Installing and configuring virtual env using pipenv"
pip install pipenv
pipenv install --skip-lock -r requirements.txt

echo "Running default tests to validate installation"

if [ "$PLATFORM_TYPE" = "macOS" ] || [ "$PLATFORM_TYPE" = "LINUX" ]
then
  DRIVER_PATH=./scripts/chromedriver
fi

if [ "$PLATFORM_TYPE" = "WINDOWS" ]
then
  DRIVER_PATH=./scripts/chromedriver.exe
fi

echo DRIVER_PATH $DRIVER_PATH

pipenv run python -m pytest -v --gherkin-terminal-reporter --driver Chrome --driver-path $DRIVER_PATH --capability headless True --variables webdriver/capabilities_web.json --variables i18n.json --variables variables.json --tags "installation_check"
