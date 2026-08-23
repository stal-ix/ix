{% extends '//die/fonts.sh' %}

{% block pkg_name %}
adwaita-fonts
{% endblock %}

{% block version %}
51.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/adwaita-fonts/{{self.version().strip()[:2]}}/adwaita-fonts-{{self.version().strip()}}.tar.xz
fa104ae2c1b96580d322f563ffe8b2dfca5296b0eca4971efd2d8011405123d2
{% endblock %}
