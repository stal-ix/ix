{% extends '//bin/gcc/11/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
12.5.0
{% endblock %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
71cd373d0f04615e66c5b5b14d49c1a4c1a08efa7b30625cd240b11bab4062b3
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*linker input file unused because linking not done.*|(void)(|' -i gcc/gcc.cc
{% endblock %}
