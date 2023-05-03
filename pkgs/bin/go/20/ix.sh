{% extends '//bin/go/19/t/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.20.4.tar.gz
sha:3bcdd27c4b5a6fad1fa3ce1f6a7e522cd6f939d9151ca1e89f40b81ef7caeefe
{% endblock %}

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
export CPPFLAGS="${CPPFLAGS} -fno-color-diagnostics"
{% endblock %}

{% block build %}
export GO_EXTLINK_ENABLED=1
{{super()}}
{% endblock %}
