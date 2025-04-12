{% extends '//die/c/autohell.sh' %}

{% block version %}
3.12
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-{{self.version().strip()}}.tar.xz
sha:2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block configure %}
{{super()}}
# pthread rwlock broken on aarch64
cat << EOF > tests/Makefile
all:
install:
EOF
cat << EOF > gnulib-tests/Makefile
all:
install:
EOF
{% endblock %}
