{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/archive/0.27/desktop-file-utils-0.27.tar.bz2
sha:55cb1da944b519ad7eae221097ff4e85edd10ffcc35990f0e88d709e034483e8
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}
