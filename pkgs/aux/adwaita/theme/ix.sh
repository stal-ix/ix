{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
adwaita-icon-theme
{% endblock %}

{% block version %}
48.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:403f650189cc41ba8321417470cbb7e484425374df7a52a3289421b9ac30e792
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
