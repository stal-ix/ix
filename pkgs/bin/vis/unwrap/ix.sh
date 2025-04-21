{% extends '//die/c/make.sh' %}

{% block pkg_name %}
vis
{% endblock %}

{% block version %}
0.9
{% endblock %}

{% block fetch %}
https://github.com/martanne/vis/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:bd37ffba5535e665c1e883c25ba5f4e3307569b6d392c60f3c7d5dedd2efcfca
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/curses
lib/termkey
lib/lua/modules/lpeg
lib/lua/modules/lpeg/dl
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --enable-curses \
    --enable-lua
{% endblock %}
