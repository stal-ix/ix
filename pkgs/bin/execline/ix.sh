{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
execline
{% endblock %}

{% block version %}
2.9.9.2
{% endblock %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b856e1a0bc8113d7110627720b7ddab3b539bcd63d4bb901a6d88470ecbb2281
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
