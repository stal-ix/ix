{% extends '//bin/gcc/11/ix.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-12.1.0/gcc-12.1.0.tar.xz
sha:62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*linker input file unused because linking not done.*|(void)(|' -i gcc/gcc.cc
{% endblock %}
