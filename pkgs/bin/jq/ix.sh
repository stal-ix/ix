{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jq
{% endblock %}

{% block version %}1.8.1{% endblock %}

{% block fetch %}
https://github.com/stedolan/jq/archive/refs/tags/jq-{{self.version()}}.tar.gz
51c4ec0913281d917f22a823d1ddcf17c9bc2be845fac987d5fe1d3ae78dd6a2
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
JQ_VERSION=\\\"{{self.version()}}\\\"
umain=main
{% endblock %}

{% block patch %}
rm src/parser.c src/parser.h src/lexer.c src/lexer.h
{% endblock %}

{% block configure_flags %}
--enable-maintainer-mode
{% endblock %}
