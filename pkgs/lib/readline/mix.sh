{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
e9557dd5b1409f5d7b37ef717c64518e
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/curses/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dxmalloc=rl_xmalloc -Dxrealloc=Drl_xrealloc ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat terminal.c | grep -v 'char PC' > _ && mv _ terminal.c
{% endblock %}

{% block configure_flags %}
--with-curses
{% endblock %}

{% block env %}
export COFLAGS="--with-installed-readline=${out} --with-readline=${out} \${COFLAGS}"
{% endblock %}
