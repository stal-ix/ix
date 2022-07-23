{% extends '//bin/go/19/t/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/go/19
{{super()}}
{% endblock %}

{% block cgo %}
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-fno-color-diagnostics ${CPPFLAGS}"
{% endblock %}

{% block build %}
export GO_EXTLINK_ENABLED=1
{{super()}}
{% endblock %}
