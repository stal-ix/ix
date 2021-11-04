{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://github.com/sabotage-linux/netbsd-curses/archive/refs/tags/v0.3.2.tar.gz
8798fe3e6acce82cb08e39b1532b4664
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block build %}
make STATIC_BINS=yes PREFIX=${out} all-static
{% endblock %}

{% block install %}
make STATIC_BINS=yes PREFIX=${out} install-static
{% endblock %}

{% block env %}
export COFLAGS="--with-curses=${out} --with-ncurses=${out} \${COFLAGS}"
{% endblock %}
