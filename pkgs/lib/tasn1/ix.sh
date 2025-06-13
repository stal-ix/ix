{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtasn1
{% endblock %}

{% block version %}
4.20.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libtasn1/libtasn1-{{self.version().strip()}}.tar.gz
92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c
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
