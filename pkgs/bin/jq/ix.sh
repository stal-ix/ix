{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jq
{% endblock %}

{% block version %}1.8.0{% endblock %}

{% block fetch %}
https://github.com/stedolan/jq/archive/refs/tags/jq-{{self.version()}}.tar.gz
sha:6f4137cfb1744e9729d177707c3880957ec3fab621db921fcb4c04e62ed9e636
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
