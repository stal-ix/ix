{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/44.0.tar.gz
sha:3bafd3b3b651ff83c7b7ae08ff3fff22ccfe4ca2e6a1687027233138020fb793
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
