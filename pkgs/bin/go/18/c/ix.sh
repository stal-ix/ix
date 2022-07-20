{% extends '//bin/go/18/t/ix.sh' %}

{% block bld_libs %}
lib/musl/pic
{% endblock %}

{% block bld_tool %}
bin/go/18
{{super()}}
{% endblock %}

{% block cgo %}
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-fno-color-diagnostics ${CPPFLAGS}"
{% endblock %}
