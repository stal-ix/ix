{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.81.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e2acc805e74675df31fa8bb99feac9df173efa5b35a18bc53fe787451316aefb
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
