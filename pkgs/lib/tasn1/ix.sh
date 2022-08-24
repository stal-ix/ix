{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz
sha:1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a
{% endblock %}

{% block bld_tool %}
bld/m4
bld/bison
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_defines %}
_GL_EXTERN_INLINE=
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*define.* _GL_EXTERN_INLINE .*||' -i config.h
{% endblock %}
