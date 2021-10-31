{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/sabotage-linux/netbsd-curses/archive/refs/tags/v0.3.2.tar.gz
# md5 8798fe3e6acce82cb08e39b1532b4664
{% endblock %}

{% block deps %}
# bld dev/build/make/package.sh
# bld env/std/package.sh
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
