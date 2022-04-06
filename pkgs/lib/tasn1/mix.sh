{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.17.0.tar.gz
c46f6eb3bd1287031ae5d36465094402
{% endblock %}

{% block bld_tool %}
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
