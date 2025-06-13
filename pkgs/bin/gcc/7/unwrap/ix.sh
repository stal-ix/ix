{% extends '//bin/gcc/8/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
7.5.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gcc/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
b81946e7f01f90528a1f7352ab08cc602b9ccc05d4e44da4bd501c5a189ee661
{% endblock %}

{% block patch %}
sed -e 's|bool error_p = NULL|bool error_p = false|' -i gcc/config/i386/i386.c
{{super()}}
{% endblock %}
