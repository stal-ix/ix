{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpciaccess
{% endblock %}

{% block version %}
0.19
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-{{self.version().strip()}}/libpciaccess-libpciaccess-{{self.version().strip()}}.tar.bz2
a595ae61e57f4c3ddb26fbc89567212efbf477b43eda8500f36e00a259f03527
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
zlib=disabled
{% endblock %}
