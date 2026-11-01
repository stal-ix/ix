{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpng
{% endblock %}

{% block version %}
1.6.59
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2540302a1844ad2b2b501977abecfa850f265f97b78f065a712ab4074a89f5b5
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block bld_libs %}
{% if wasi %}
lib/shim/setjmp
{% endif %}
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block configure_flags %}
--disable-tests
--disable-tools
{% if riscv64 %}
--enable-riscv-rvv=off
{% endif %}
{% endblock %}
