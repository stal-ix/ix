{% extends '//dev/lang/bison/template/package.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bison/bison-3.5.1.tar.xz
# md5 6fc5fa4488832a65db934b9e93bd5d4c
{% endblock %}

{% block bison %}
# bld dev/lang/bison/341/stage2
{% endblock %}

{% block patch %}
(
    set -eu

    cd src
    rm parse-gram.c parse-gram.h
    cat parse-gram.y | grep -v 'define api.token.raw' > _ && mv _ parse-gram.y
)
{% endblock %}
