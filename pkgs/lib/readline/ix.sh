{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
sha:f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02
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
