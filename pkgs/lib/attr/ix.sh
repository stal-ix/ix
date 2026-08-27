{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
attr
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/attr/attr-{{self.version().strip()}}.tar.gz
d42fa374513180bb48cb11a46696f488240e5124ff1e6ad88b0abff706985612
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/shim/gnu/basename/overlay
{% endblock %}
