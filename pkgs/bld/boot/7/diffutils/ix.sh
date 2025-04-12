{% extends '//bin/diffutils/ix.sh' %}

{% block pkg_name %}
diffutils
{% endblock %}

{% block version %}
3.7
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-{{self.version().strip()}}.tar.xz
sha:b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
