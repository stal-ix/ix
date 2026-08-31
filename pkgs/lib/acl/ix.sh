{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
acl
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/acl/acl-{{self.version().strip()}}.tar.xz
e661131456d2708a01c614a0f400e11d7d1bfaeb6f3e74b75bb980b72f0161a3
{% endblock %}

{% block lib_deps %}
lib/c
lib/attr
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block bld_libs %}
lib/linux/headers
{% endblock %}
