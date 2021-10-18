from __future__ import unicode_literals
import os
import sys

BASE_DIR = os.path.abspath(os.path.join(
    os.path.dirname(__file__), ".."
))

EXTERNAL_LIBS_PATH = os.path.join(
    BASE_DIR, "externals", "libs"
)
EXTERNAL_APPS_PATH = os.path.join(
    BASE_DIR, "externals", "apps"
)
sys.path = ["", EXTERNAL_LIBS_PATH, EXTERNAL_APPS_PATH] + \
    sys.path
