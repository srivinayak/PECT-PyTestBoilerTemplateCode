#!/bin/sh
echo "Identifying platform type ..."
case "$(uname)" in
  Darwin*)    PLATFORM_TYPE="macOS"; \
              ;;
  Linux*)     PLATFORM_TYPE="LINUX"; \
              ;;
  WindowsNT* | MINGW64* ) PLATFORM_TYPE="WINDOWS"; \
              ;;
  *)          echo "Unknown platform: $(uname). Exiting!!!"; \
              exit;;
esac

echo "platform is: ""$PLATFORM_TYPE""";

echo "Identifying python version ...";
PYTHON_VERSION=$(command python --version);

case "$PYTHON_VERSION" in
    *"3.8"*)
        true
    ;;
    *"3.9"*)
        true
    ;;
    *)
        echo "Python 3.8.x or 3.9.x not installed. You are using ""$PYTHON_VERSION"". Exiting!!!"; \
        exit;
   ;;
esac

echo "$PYTHON_VERSION"" installed at location: ""$(command which python)";
unset PYTHON_VERSION

export PLATFORM_TYPE;
