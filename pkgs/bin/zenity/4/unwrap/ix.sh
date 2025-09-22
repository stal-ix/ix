{% extends '//bin/zenity/t/ix.sh' %}

{% block pkg_name %}
zenity
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/zenity/archive/refs/tags/{{self.version().strip()}}.tar.gz
254266e60fd53f7c91b4f3abdcf35ce8ed3b859e0dc3dbb70e444eba9087eba5
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
