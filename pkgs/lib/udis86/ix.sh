{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vmt/udis86/archive/refs/tags/v1.7.2.tar.gz
sha:43567f7e12168943c5b5ffb3d3f5b7a33cb36328f8938a993458f3ded0ba5779
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
