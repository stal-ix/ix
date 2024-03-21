{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://download.tuxfamily.org/chrony/chrony-4.5.tar.gz
sha:19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/edit
lib/kernel
lib/seccomp
lib/tom/crypt
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*mkdir.*SYSCONFDIR.*||'   \
    -e 's|.*mkdir.*CHRONYVARDIR.*||' \
    -i Makefile
{% endblock %}
