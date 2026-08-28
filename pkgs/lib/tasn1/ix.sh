{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtasn1
{% endblock %}

{% block version %}
4.21.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libtasn1/libtasn1-{{self.version().strip()}}.tar.gz
1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87
{% endblock %}

{% block bld_tool %}
bld/m4
bld/bison
bld/texinfo
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
