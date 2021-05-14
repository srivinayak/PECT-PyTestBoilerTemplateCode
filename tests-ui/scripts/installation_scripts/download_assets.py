import os
import platform

import requests

BROWSERSTACK_LOCAL_MAC = "https://www.browserstack.com/browserstack-local/BrowserStackLocal-darwin-x64.zip"
BROWSERSTACK_LOCAL_LINUX = "https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip"
BROWSERSTACK_LOCAL_WINDOWS = "https://www.browserstack.com/browserstack-local/BrowserStackLocal-win32.zip"

CHROMEDRIVER_MAC = "https://chromedriver.storage.googleapis.com/%s/chromedriver_mac64.zip"
CHROMEDRIVER_LINUX = "https://chromedriver.storage.googleapis.com/%s/chromedriver_linux64.zip"
CHROMEDRIVER_WINDOWS = "https://chromedriver.storage.googleapis.com/%s/chromedriver_win32.zip"


def get_bs_local_by_platform(temp_dir, scripts_dir):
    platform_type = platform.system().lower()
    print("Downloading BrowserStackLocal script for %s platform" % platform_type)
    if platform_type == "darwin":
        response = requests.get(BROWSERSTACK_LOCAL_MAC, allow_redirects=True)
    elif platform_type == "linux":
        response = requests.get(BROWSERSTACK_LOCAL_LINUX, allow_redirects=True)
    elif platform_type == "windows":
        response = requests.get(BROWSERSTACK_LOCAL_WINDOWS, allow_redirects=True)
    else:
        print(f"Unknown Platform Type {platform_type}. Exiting...")
        exit(1)

    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)
    f = open(temp_dir + "/BrowserstackLocal.zip", "wb")
    f.write(response.content)
    f.close()

    if not os.path.exists(scripts_dir):
        os.makedirs(scripts_dir)
    stream = os.popen('unzip %s -d %s' % (f.name, scripts_dir))
    output = stream.read()
    print(output)
    print("BrowserStackLocal script saved at location: %s \n" % scripts_dir)


def get_chromedriver_by_platform(temp_dir, scripts_dir):
    print("Getting ChromeDriver latest release version")
    response = requests.get("https://chromedriver.storage.googleapis.com/LATEST_RELEASE")
    latest_release = response.text

    platform_type = platform.system().lower()
    print("Downloading WebDriver version %s for %s platform" % (latest_release, platform_type))
    if platform_type == "darwin":
        response = requests.get(CHROMEDRIVER_MAC % latest_release, allow_redirects=True, stream=True)
    elif platform_type == "linux":
        response = requests.get(CHROMEDRIVER_LINUX % latest_release, allow_redirects=True, stream=True)
    elif platform_type == "windows":
        response = requests.get(CHROMEDRIVER_WINDOWS % latest_release, allow_redirects=True, stream=True)
    else:
        print(f"Unknown Platform Type {platform_type}. Exiting...")
        exit(1)

    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)
    f = open(temp_dir + "/ChromeDriver.zip", "wb")
    f.write(response.content)
    f.close()

    if not os.path.exists(scripts_dir):
        os.makedirs(scripts_dir)
    stream = os.popen('unzip %s -d %s' % (f.name, scripts_dir))
    output = stream.read()
    print(output)
    print("WebDriver script saved at location: %s \n" % scripts_dir)
