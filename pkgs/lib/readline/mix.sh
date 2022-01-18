{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
e9557dd5b1409f5d7b37ef717c64518e
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block c_rename_symbol %}
xmalloc
xrealloc
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
