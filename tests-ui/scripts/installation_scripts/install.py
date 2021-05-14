import os
from shutil import rmtree

from download_assets import get_bs_local_by_platform, get_chromedriver_by_platform


PROJECT_DIR = os.getcwd()
TEMP_DIR = PROJECT_DIR + "/temp"


SCRIPTS_DIR = PROJECT_DIR + "/scripts"

get_bs_local_by_platform(TEMP_DIR, SCRIPTS_DIR)
get_chromedriver_by_platform(TEMP_DIR, SCRIPTS_DIR)

rmtree(TEMP_DIR)


