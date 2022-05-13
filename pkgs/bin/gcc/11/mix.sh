{% extends '//bin/gcc/10/mix.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-11.3.0/gcc-11.3.0.tar.xz
sha:b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39
{% endblock %}

{% block patch %}
sed -e 's|.*linker input file unused because linking not done.*|(void)(|' -i gcc/gcc.cc
{% endblock %}
