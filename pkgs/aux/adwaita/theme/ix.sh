{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
adwaita-icon-theme
{% endblock %}

{% block version %}
50.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/{{self.version().strip()}}.tar.gz
57df20a3ed2edf1381b4b9e32856036fdce821c302c673cb632e52a35a4536e2
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
