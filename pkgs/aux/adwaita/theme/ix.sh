{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
#https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/archive/41.0/adwaita-icon-theme-41.0.tar.bz2
#sha:4f7588771b9f1d28d21041149716ddfe68d2d8eed9bfb0cfd419a424c93c1a80
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/43.tar.gz
sha:15c635c227f85d78121841e40815ed5277c7580c9c80e01f1613a807d931b4c1
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
