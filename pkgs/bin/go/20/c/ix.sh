{% extends '//bin/go/20/t/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/go/20
{{super()}}
{% endblock %}

{% block cgo %}
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="${CPPFLAGS} -fno-color-diagnostics"
{% endblock %}

{% block build %}
export GO_EXTLINK_ENABLED=1
{{super()}}
{% endblock %}
