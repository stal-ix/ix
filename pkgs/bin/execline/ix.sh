{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
execline
{% endblock %}

{% block version %}
2.10.0.0
{% endblock %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cab91d3c1b9d57184ae499900641ab4ab42771c7b2069ec5cc62dffeb3dbe2b4
{% endblock %}

{% block lib_deps %}
lib/c
lib/skalibs
{% endblock %}

{% block configure_flags %}
--enable-multicall
{% endblock %}

{% block make_flags %}
{{super()}}
VPATH=${MAKE_VPATH}
{% endblock %}
