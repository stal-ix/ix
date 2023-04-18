{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/dbus
lib/lua/puc/5/2
{% endblock %}

{% block setup %}
{{super()}}
export COPTS="-DHAVE_DBUS -DHAVE_LUASCRIPT ${COPTS}"
{% endblock %}
