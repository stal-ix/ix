{% extends '//die/go/build.sh' %}

{% block pkg_name %}
landrun
{% endblock %}

{% block version %}
0.1.9
{% endblock %}

{% block go_url %}
https://github.com/Zouuup/landrun/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b5456e47886299e964b8fb07086173fed6dca8a526cc06ea8920e895a5a28d29
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/landrun
{% endblock %}

{% block go_bins %}
landrun
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
