{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpng
{% endblock %}

{% block version %}
1.6.49
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e425762fdfb9bb30a5d2da29c0067570e96b5d41d79c659cf0dad861e9df738e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block configure_flags %}
{% if riscv64 %}
--enable-riscv-rvv=off
{% endif %}
{% endblock %}
