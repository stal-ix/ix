{% extends '//bin/go/19/t/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.20.6.tar.gz
sha:baaebb7ad7f0054ac4f7fd39ec6e1fec17e187301cc479f499fab7ac61ca58c7
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
