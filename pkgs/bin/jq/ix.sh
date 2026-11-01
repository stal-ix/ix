{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jq
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/stedolan/jq/archive/refs/tags/jq-{{self.version().strip()}}.tar.gz
188d03d029e8242a366d2286f07638924afe997120f6057e606f3c7a33984312
{% endblock %}

{% block bld_libs %}
lib/c
lib/oniguruma
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/fakegit
{% endblock %}

{% block cpp_defines %}
JQ_VERSION=\\\"{{self.version().strip()}}\\\"
umain=main
{% endblock %}

{% block patch %}
rm src/parser.c src/parser.h src/lexer.c src/lexer.h
{% endblock %}

{% block configure_flags %}
--enable-maintainer-mode
{% endblock %}
