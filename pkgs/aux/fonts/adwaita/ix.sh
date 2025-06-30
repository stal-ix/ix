{% extends '//die/fonts.sh' %}

{% block pkg_name %}
adwaita-fonts
{% endblock %}

{% block version %}
49.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/adwaita-fonts/{{self.version().strip()[:2]}}/adwaita-fonts-{{self.version().strip()}}.tar.xz
3157c620eb5b72b25ab156d194aa4eb223f9870d547fe83fdbdf06d3e7becb37
{% endblock %}
