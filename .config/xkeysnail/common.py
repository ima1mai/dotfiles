import re
from xkeysnail.transform import *

"""
Common key maps across any key-boards
"""

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_multipurpose_modmap({
	# Capslock is escape when pressed and released. Control when held down.
	Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
        # Map D to Super when held down
        # to enable Vim-like cursor
	# Key.D: [Key.D, Key.LEFT_META]
})

define_keymap(lambda wm_class: wm_class not in ("Pantheon-terminal"), {
	# Mac like settings
	K("Alt-c"): K("C-c"),
	K("Alt-v"): K("C-v"),
	K("Alt-l"): K("C-l"),
	K("Alt-w"): K("C-w"),
	K("Alt-q"): K("C-q"),
        # hankaku, zenkaku
	K("C-j"): Key.F10,
	K("C-k"): Key.F7,
	K("C-l"): Key.F9,
	K("C-SEMICOLON"): Key.F8
}, "Mac-like settings")

define_keymap(None, {
    K('Super-h'): Key.LEFT,
    K('Super-j'): Key.DOWN,
    K('Super-k'): Key.UP,
    K('Super-l'): Key.RIGHT
}, "Vim-like cursor")

define_keymap(re.compile('Pantheon-terminal'), {
    K('esc'): [K('left_alt'), K('esc')],
    K("Alt-c"): K("C-Shift-c"),
    K("Alt-v"): K("C-Shift-v"),
    K("Alt-t"): K("C-Shift-t")
}, "Esc and IME off for vim")

