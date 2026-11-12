{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.104.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b3c3445e71d1667c548f14c53a8d0d2ec831f4dbac7d9156ba0e6f6331d0aeaf
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block go_bins %}
gh
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
