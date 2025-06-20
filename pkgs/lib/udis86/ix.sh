{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
udis86
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/vmt/udis86/archive/refs/tags/v{{self.version().strip()}}.tar.gz
43567f7e12168943c5b5ffb3d3f5b7a33cb36328f8938a993458f3ded0ba5779
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block configure_flags %}
--with-python=python3
{% endblock %}

{% block patch %}
sed -e 's| / | // |' -i scripts/ud_opcode.py
{% endblock %}
