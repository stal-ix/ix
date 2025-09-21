{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
adwaita-icon-theme
{% endblock %}

{% block version %}
49.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/{{self.version().strip()}}.tar.gz
0702ce73eb9316d48f074b183ba71d87e9f9f76a399020de70f3eea824db8b5e
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
