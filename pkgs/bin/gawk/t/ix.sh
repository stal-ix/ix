{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gawk
{% endblock %}

{% block version %}
5.4.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-{{self.version().strip()}}.tar.xz
07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37
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
