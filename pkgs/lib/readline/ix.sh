{% extends '//die/c/autohell.sh' %}

# noauto

{% block pkg_name %}
readline
{% endblock %}

{% block version %}
8.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/readline/readline-{{self.version().strip()}}.tar.gz
fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc
https://ftp.gnu.org/gnu/readline/readline-8.3-patches/readline83-001
21f0a03106dbe697337cd25c70eb0edbaa2bdb6d595b45f83285cdd35bac84de
https://ftp.gnu.org/gnu/readline/readline-8.3-patches/readline83-002
e27364396ba9f6debf7cbaaf1a669e2b2854241ae07f7eca74ca8a8ba0c97472
https://ftp.gnu.org/gnu/readline/readline-8.3-patches/readline83-003
72dee13601ce38f6746eb15239999a7c56f8e1ff5eb1ec8153a1f213e4acdb29
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/readline-*
ls ${src}/readline83* | sort | while read l; do
    cat ${l} | patch -p0
done
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

{% block env %}
export COFLAGS="--with-installed-readline=${out} --with-readline=${out} \${COFLAGS}"
{% endblock %}
