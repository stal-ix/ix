{% extends '//bin/go/19/t/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.20.7.tar.gz
sha:5f68e08caf09ba1ea8c3c256206673aaf70fa6abce98e6873ef75f01fe69f486
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

{% block setup_target_flags %}
{{super()}}
export CPPFLAGS="${CPPFLAGS} -fno-color-diagnostics"
{% endblock %}

{% block build %}
export GO_EXTLINK_ENABLED=1
{{super()}}
{% endblock %}
