{% extends '//bin/go/19/t/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.20.2.tar.gz
sha:176969bb14216dd45121e46d5d0f63d339edb9042d1389d485fb6b21ee172388
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
