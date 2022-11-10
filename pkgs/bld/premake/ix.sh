{% extends '//bin/premake/ix.sh' %}

{% block premake_tool %}
bld/premake/boot
{% endblock %}

{% block premake_flags %}
{{super()}}
--no-zlib
--no-curl
{% endblock %}
