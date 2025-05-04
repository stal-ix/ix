{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
linux-pam
{% endblock %}

{% block version %}
1.7.0
{% endblock %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1dad9cb50b4a19accd7d7b9716777caf5a0f33d26f018f27d63e9e095998f12b
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
lib/dlfcn
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/build/muldefs
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
{% endblock %}
