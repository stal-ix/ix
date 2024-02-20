{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.xz
sha:ca9c16d3d11d0ff8c69d79dc0b47267e1329a69b39b799895604ed447d3ca90b
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
