{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-3.11.tar.xz
sha:a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e
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
