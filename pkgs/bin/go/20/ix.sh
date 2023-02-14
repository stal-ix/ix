{% extends '//bin/go/19/t/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.20.1.tar.gz
sha:5db737840a740457c1b4b73b90dad6daa57af0da420f3ea51c39a1a81abbcc41
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
