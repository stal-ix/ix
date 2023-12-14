{% extends '//die/c/autorehell.sh' %}

{% block version %}1.7.1{% endblock %}

{% block fetch %}
https://github.com/stedolan/jq/archive/refs/tags/jq-{{self.version()}}.tar.gz
sha:fc75b1824aba7a954ef0886371d951c3bf4b6e0a921d1aefc553f309702d6ed1
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
{% endblock %}

{% block patch %}
rm src/parser.c src/parser.h src/lexer.c src/lexer.h
{% endblock %}

{% block configure_flags %}
--enable-maintainer-mode
{% endblock %}
