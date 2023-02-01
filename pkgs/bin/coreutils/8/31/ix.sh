{% extends '//bin/coreutils/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz
sha:ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd
{% endblock %}

{% block bld_tool %}
{% block yacc %}
bld/byacc
{% endblock %}
{{super()}}
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{{super()}}
{% endblock %}
