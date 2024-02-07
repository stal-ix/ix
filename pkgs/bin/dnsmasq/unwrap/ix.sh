{% extends '//bin/dnsmasq/t/ix.sh' %}

{% block bld_libs %}
lib/lua
lib/dbus
{{super()}}
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export COPTS="-DHAVE_DBUS -DHAVE_LUASCRIPT ${COPTS}"
{% endblock %}
