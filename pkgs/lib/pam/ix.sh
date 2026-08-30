{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
linux-pam
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d7ce5cb6e07ee8603d8af41a672bcb515b9d27079ee309fb3f729a8020166694
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/build/muldefs
{% endblock %}

{% block meson_flags %}
vendordir=
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
ln -s ../include security
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}
