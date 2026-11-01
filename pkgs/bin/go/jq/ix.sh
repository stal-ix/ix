{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gojq
{% endblock %}

{% block version %}
0.12.20
{% endblock %}

{% block go_url %}
https://github.com/itchyny/gojq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
393d9fafe093094ca10e27997d42db29f6fc6661771e91fe01d1f7cea99e3200
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gojq
{% endblock %}

{% block go_bins %}
gojq
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
