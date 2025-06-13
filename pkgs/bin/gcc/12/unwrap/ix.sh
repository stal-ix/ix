{% extends '//bin/gcc/11/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
12.4.0
{% endblock %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
704f652604ccbccb14bdabf3478c9511c89788b12cb3bbffded37341916a9175
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*linker input file unused because linking not done.*|(void)(|' -i gcc/gcc.cc
{% endblock %}
