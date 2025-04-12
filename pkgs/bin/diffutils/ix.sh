{% extends '//die/c/autohell.sh' %}

{% block version %}
3.12
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-{{self.version().strip()}}.tar.xz
sha:7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd
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
