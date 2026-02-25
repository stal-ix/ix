{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gawk
{% endblock %}

{% block version %}
5.4.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-{{self.version().strip()}}.tar.xz
3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1
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
rm -rf ${out}/etc
rm ${out}/bin/gawk-*
{% endblock %}

{% block cpp_missing %}
{% if darwin %}
mach-o/dyld.h
{% endif %}
{% endblock %}
