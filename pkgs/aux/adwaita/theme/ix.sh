{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
adwaita-icon-theme
{% endblock %}

{% block version %}
51.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/{{self.version().strip()}}.tar.gz
adda5270c67ecdeb9604d24202fd8558b193379f9a9488179591cd4cdd99593b
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
