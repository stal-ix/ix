{% extends '//die/fonts.sh' %}

{% block pkg_name %}
adwaita-fonts
{% endblock %}

{% block version %}
48.2
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/adwaita-fonts/48/adwaita-fonts-{{self.version().strip()}}.tar.xz
156f7e92f2f82e527fc73c309dbb237c0a4a5c3a95bc5ee94a5efb6947c553e0
{% endblock %}
