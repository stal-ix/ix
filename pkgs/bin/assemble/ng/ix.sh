{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/11.tar.gz
{% endblock %}

{% block go_sha %}
334e827f3df2ddf6fa1d5054fb71c6197c1138a83202c3ab8356656c2ab691e2
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}

{% block step_setup %}
{{super()}}
export CGO_ENABLED=0
export GO_EXTLINK_ENABLED=0
{% endblock %}
