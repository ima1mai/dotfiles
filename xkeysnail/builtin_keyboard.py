import re
from xkeysnail.transform import *


# [Global modemap] Change modifier keys as in xmodmap
"""
define_modmap({
    # Swap CapsLock to Left-Ctrl
    Key.CAPSLOCK: Key.LEFT_CTRL
})
"""

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_multipurpose_modmap({
	# Capslock is escape when pressed and released. Control when held down.
	Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
})

define_keymap(lambda wm_class: wm_class not in ("Pantheon-terminal"), {
	# Mac like settings
	K("Alt-c"): K("C-c"),
	K("Alt-v"): K("C-v"),
	K("Alt-l"): K("C-l"),
	K("Alt-w"): K("C-w"),
	K("Alt-q"): K("C-q")
}, "Mac-like settings")

define_keymap(None, {
    K('C-h'): Key.LEFT,
    K('C-j'): Key.DOWN,
    K('C-k'): Key.UP,
    K('C-l'): Key.RIGHT,
}, "Vim-like cursor")

define_keymap(re.compile('Pantheon-terminal'), {
    K('esc'): [K('left_alt'), K('esc')],
	K("Alt-c"): K("C-Shift-c"),
	K("Alt-v"): K("C-Shift-v")
}, "Esc and IME off for vim")

