{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
make
{% endblock %}

{% block version %}
4.4.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-{{self.version().strip()}}.tar.gz
sha:dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block c_rename_symbol %}
{% if darwin %}
glob
fnmatch
globfree
{% endif %}
{% endblock %}

{% block cpp_includes %}
${PWD}/glob
{% endblock %}

{% block configure_flags %}
--disable-load
{% endblock %}
