{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
acl
{% endblock %}

{% block version %}
2.3.2
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/acl/acl-{{self.version().strip()}}.tar.xz
97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd
{% endblock %}

{% block lib_deps %}
lib/c
lib/attr
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
