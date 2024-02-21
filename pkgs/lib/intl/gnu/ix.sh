{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/gperf
bld/bison
bld/gettext
{% endblock %}

{% block patch %}
{{super()}}
# WASI fix
sed -e 's|SUBDIRS = .*|SUBDIRS = intl po|' -i Makefile.am
{% endblock %}
