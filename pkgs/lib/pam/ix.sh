{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
linux-pam
{% endblock %}

{% block version %}
1.7.3
{% endblock %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v{{self.version().strip()}}.tar.gz
29c2a93f819a62ba981f695b03fe00550b49ce7ae5c5342edaaf860687fbb1a0
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
