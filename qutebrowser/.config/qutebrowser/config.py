# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {
    '<Ctrl+[>': '<Escape>',
    '<Ctrl+6>': '<Ctrl+^>',
    '<Ctrl+m>': '<Return>',
    '<Ctrl+j>': '<Return>',
    '<Shift+Return>': '<Return>',
    '<Enter>': '<Return>',
    '<Shift+Enter>': '<Return>',
    '<Ctrl+Enter>': '<Ctrl+Return>',
}

# Bindings for normal mode
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')