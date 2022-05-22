{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/stedolan/jq/archive/refs/tags/jq-1.6.tar.gz
sha:158182b85f3be9e23ab1dc50cfcc24e415aade2a0b8a5d9f709e0b587666d61b
{% endblock %}

{% block bld_libs %}
lib/c
lib/oniguruma
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block patch1 %}
# TODO(pg): proper bootstrap
rm src/parser.c src/parser.h src/lexer.c src/lexer.h
{% endblock %}
