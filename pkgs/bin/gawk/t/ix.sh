{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gawk
{% endblock %}

{% block version %}
5.3.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-{{self.version().strip()}}.tar.xz
sha:694db764812a6236423d4ff40ceb7b6c4c441301b72ad502bb5c27e00cd56f78
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
{% endblock %}

{% block c_rename_symbol %}
err
regcomp
regfree
xmalloc
xrealloc
{% endblock %}

{% block configure_flags %}
--disable-extensions
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/gawk-*
{% endblock %}
