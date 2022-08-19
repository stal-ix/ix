{% extends '//bin/gcc/11/ix.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-12.2.0/gcc-12.2.0.tar.xz
sha:e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*linker input file unused because linking not done.*|(void)(|' -i gcc/gcc.cc
{% endblock %}
