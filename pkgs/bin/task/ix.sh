{% extends '//die/go/build.sh' %}

{% block pkg_name %}
task
{% endblock %}

{% block version %}
3.14.0
{% endblock %}

{% block go_url %}
https://github.com/go-task/task/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
140e9e91906b8f2c1a2ea66ee62c2dc6a9ec5f2cc672e878c81c3058deb46dda
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/task
{% endblock %}

{% block go_bins %}
task
{% endblock %}
