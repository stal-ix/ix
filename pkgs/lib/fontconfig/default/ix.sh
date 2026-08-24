{% extends '//lib/fontconfig/bootstrap/ix.sh' %}

{% block configure %}
{{super()}}

sed -e "s|${out}/etc/fonts|/etc/fonts|g" \
    -e "s|${out}/var/cache/fontconfig|/var/cache/fontconfig|g" \
    -e "s|${out}/share/fontconfig|/usr/share/fontconfig|g" \
    -i ${tmp}/obj/meson-config.h
{% endblock %}
