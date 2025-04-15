{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gawk
{% endblock %}

{% block version %}
5.3.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-{{self.version().strip()}}.tar.xz
sha:f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc
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
