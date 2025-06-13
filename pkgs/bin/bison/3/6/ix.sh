{% extends '//bin/bison/3/7/ix.sh' %}

{% block pkg_name %}
bison
{% endblock %}

{% block version %}
3.6.4
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-{{self.version().strip()}}.tar.xz
8b13473b31ca7fcf65e5e8a74224368ffd5df19275602a9c9567ba393f18577d
{% endblock %}

{% block bld_libs %}
lib/obstack
{{super()}}
{% endblock %}
