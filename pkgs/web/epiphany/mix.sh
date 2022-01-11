{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/epiphany/-/archive/41.3/epiphany-41.3.tar.bz2
sha:
{% endblock %}

{% block bld_libs %}
web/epiphany/libs(gtk_ver=3)
{% endblock %}
