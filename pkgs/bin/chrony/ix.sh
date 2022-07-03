{% extends '//die/autohell.sh' %}

{% block fetch %}
https://download.tuxfamily.org/chrony/chrony-4.2.tar.gz
sha:273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a
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
