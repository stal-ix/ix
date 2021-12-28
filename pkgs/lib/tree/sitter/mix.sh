{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.20.1.tar.gz
978021405519b951486302c68c3476cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
SOEXTVER=a
{% endblock %}

{% block patch %}
sed -e 's|.*ln -sf.*||' \
    -e 's|libtree-sitter.*SO.*OBJ.*|qw:|' \
    -i Makefile
{% endblock %}
