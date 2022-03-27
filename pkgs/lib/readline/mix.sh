{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
e9557dd5b1409f5d7b37ef717c64518e
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block c_rename_symbol %}
xmalloc
xrealloc
{% endblock %}

{% block patch %}
sed -e 's|.*char PC.*||' -i terminal.c
{% endblock %}

{% block configure_flags %}
--with-curses
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*termcap.*||' -i ${out}/lib/pkgconfig/readline.pc
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-installed-readline=${out} --with-readline=${out} \${COFLAGS}"
{% endblock %}
