{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yq
{% endblock %}

{% block version %}
4.54.3
{% endblock %}

{% block go_url %}
https://github.com/mikefarah/yq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e3f90f392e41e0a0e07a96a7e6808b8518580bcaa12480347e6a0c5fa06384db
{% endblock %}

{% block go_bins %}
yq
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
