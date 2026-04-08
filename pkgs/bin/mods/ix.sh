{% extends '//die/go/build.sh' %}

{% block pkg_name %}
mods
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/mods/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3ce9c2ac3b38b8080283e9cc3516a8ad0cd1c009cc9001a020d27bdf1ceaf443
{% endblock %}

{% block go_bins %}
mods
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
