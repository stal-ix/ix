{% extends '//bin/dns/masq/t/ix.sh' %}

{% block bld_libs %}
lib/lua
lib/dbus
lib/shim/fake/pkg(pkg_name=lua,pkg_ver=100500)
{{super()}}
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export COPTS="-DHAVE_DBUS -DHAVE_LUASCRIPT ${COPTS}"
{% endblock %}
