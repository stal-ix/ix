{% extends '//bin/mawk/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/c
{% endblock %}

{% block host_libs %}
{{super()}}
lib/c
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/byacc
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-build-cc=${HOST_CC}
{% endblock %}
