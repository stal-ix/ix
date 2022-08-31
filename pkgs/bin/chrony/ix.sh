{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://download.tuxfamily.org/chrony/chrony-4.3.tar.gz
sha:9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/edit
lib/linux
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
