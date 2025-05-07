{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
execline
{% endblock %}

{% block version %}
2.9.7.0
{% endblock %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a2794477b31d66cc301d0e97f182e2be736ee763291335412792cbc7e301d964
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
