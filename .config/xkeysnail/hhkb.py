import sys
sys.path.append('/home/ryo/.config/xkeysnail/')
from xkeysnail.transform import *

"""
For HHKB Lite 2 
"""

# [Global modemap] Change modifier keys as in xmodmap
define_modmap({
    # Swap CapsLock to Left-Ctrl
    Key.LEFT_ALT: Key.LEFT_META,
    Key.LEFT_META: Key.LEFT_ALT,
    Key.RIGHT_ALT: Key.RIGHT_META,
    Key.RIGHT_META: Key.RIGHT_ALT
})

import common
