{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yq
{% endblock %}

{% block version %}
4.54.2
{% endblock %}

{% block go_url %}
https://github.com/mikefarah/yq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5f63436d3d1b6ba87e60e81f726749a239ca575ba7a1d95a73079944a640bd8d
{% endblock %}

{% block go_bins %}
yq
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
