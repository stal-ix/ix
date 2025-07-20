{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.76.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f1bb766607ad79407e697ae197d8d259be9fc1a9049be7c6c85ebbde1bf2c3ef
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block go_bins %}
gh
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
