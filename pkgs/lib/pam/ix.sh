{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
linux-pam
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v{{self.version().strip()}}.tar.gz
82aadd97eb697965b577069c12046a4dd1be68361a9978c708698d2a1ee9b6d1
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
