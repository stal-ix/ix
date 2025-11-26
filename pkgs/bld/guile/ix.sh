{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/guile/guile-3.0.10.tar.gz
2dbdbc97598b2faf31013564efb48e4fed44131d28e996c26abe8a5b23b56c2a
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/gmp
lib/boehmgc
lib/unistring
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block postinstall %}
echo 'skip'
{% endblock %}
