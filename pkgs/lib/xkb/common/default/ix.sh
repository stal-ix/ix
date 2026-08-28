{% extends '//lib/xkb/common/base/ix.sh' %}

{% block meson_flags %}
{{super()}}
x-locale-root=/usr/share/X11/locale
xkb-config-root=/usr/share/X11/xkb
xkb-config-extra-path=/etc/xkb
{% endblock %}

{# DFLT_XKB_LEGACY_ROOT has no meson option; it falls back to prefix/datadir. #}
{% block configure %}
{{super()}}

sed -e "s|${out}/share/X11/xkb|/usr/share/X11/xkb|g" \
    -i ${tmp}/obj/config.h
{% endblock %}
