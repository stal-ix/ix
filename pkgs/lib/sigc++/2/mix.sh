{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libsigc++/2.10/libsigc%2B%2B-2.10.7.tar.xz
sha:d082a2ce72c750f66b1a415abe3e852df2eae1e8af53010f4ac2ea261a478832
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
