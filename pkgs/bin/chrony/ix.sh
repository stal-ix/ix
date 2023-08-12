{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://download.tuxfamily.org/chrony/chrony-4.4.tar.gz
sha:eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088
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
