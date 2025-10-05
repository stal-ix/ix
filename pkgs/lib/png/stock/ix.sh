{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpng
{% endblock %}

{% block version %}
1.6.50
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
71158e53cfdf2877bc99bcab33641d78df3f48e6e0daad030afe9cb8c031aa46
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
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
