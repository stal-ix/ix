{% extends '//die/go/build.sh' %}

{% block pkg_name %}
glow
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/glow/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5b4d842c651c6b2e28522c2c24d05f7fc62bb744892fe6917dbc644595978bb0
{% endblock %}

{% block go_bins %}
glow
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
