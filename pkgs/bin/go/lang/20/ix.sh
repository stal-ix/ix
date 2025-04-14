{% extends '//bin/go/lang/19/t/ix.sh' %}

{% block version %}
1.20.14
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
sha:d300b7572b3763216bfaeeb8d4405052548c18c70f6a9e1d64f552515141a63a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
{% block go_bootstrap %}
bin/go/lang/19
{% endblock %}
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
