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
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block go_bins %}
glow
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
