{% extends '//bin/gcc/8/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gcc/gcc-7.5.0/gcc-7.5.0.tar.xz
sha:b81946e7f01f90528a1f7352ab08cc602b9ccc05d4e44da4bd501c5a189ee661
{% endblock %}

{% block patch %}
sed -e 's|bool error_p = NULL|bool error_p = false|' -i gcc/config/i386/i386.c
{{super()}}
{% endblock %}
