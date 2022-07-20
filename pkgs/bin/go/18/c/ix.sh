{% extends '//bin/go/18/ix.sh' %}

{% block bld_libs %}
lib/musl/pic
{% endblock %}

{% block cgo %}
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-fno-color-diagnostics ${CPPFLAGS}"
{% endblock %}
