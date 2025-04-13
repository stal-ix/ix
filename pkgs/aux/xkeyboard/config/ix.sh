{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
xkeyboard-config
{% endblock %}

{% block version %}
2.44
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/archive/xkeyboard-config-2.41/xkeyboard-config-xkeyboard-config-{{self.version().strip()}}.tar.bz2
sha:076978baf61655d6d9404e6a7d8a4ba304256c301574e80007f6dd941f6ba349
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
{% endblock %}

{% block env %}
export XKB_CONFIG="${out}/share/X11/xkb"
{% endblock %}

{#
ix/build/8QI51vcj4Yc20ltl/src/build/qemu-keymap -f pc-bios/keymaps/ar -l ar
xkbcommon: ERROR: Couldn't find file "symbols/ar" in include paths
xkbcommon: ERROR: 1 include paths searched:
xkbcommon: ERROR:   /ix/store/tYxqJQfbGp45fjJD-aux-xkeyboard-config/share/X11/xkb
xkbcommon: ERROR: 1 include paths could not be added:
xkbcommon: ERROR:   /ix/store/uqszlytMmakBrOId-lib-xkbcommon/etc/xkb
xkbcommon: ERROR: Abandoning symbols file "(unnamed)"
xkbcommon: ERROR: Failed to compile xkb_symbols
xkbcommon: ERROR: Failed to compile keymap
#}

{% block install %}
{{super()}}
cd ${out}/share/X11/xkb/symbols
cp ara ar
{% endblock %}
