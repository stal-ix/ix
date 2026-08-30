{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sed
{% endblock %}

{% block version %}
4.10
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/sed/sed-{{self.version().strip()}}.tar.xz
b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% if mingw32 %}
lib/shim/dll(dll_name=bcrypt)
{% endif %}
{% endblock %}
