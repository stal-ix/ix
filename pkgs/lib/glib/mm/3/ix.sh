{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.77/glibmm-2.77.0.tar.xz
sha:7cb34684e7ac6dfbf83492a52dff3f919e2fff63eb7810613bf71eb272d5450e
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}
