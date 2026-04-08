{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gum
{% endblock %}

{% block version %}
0.14.5
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/gum/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f49a27891d7a7b2d08e013e3a2a6fe8498e0414c759373ccee179f168ce0b366
{% endblock %}

{% block go_bins %}
gum
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
