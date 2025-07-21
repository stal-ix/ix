{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nspr
{% endblock %}

{% block version %}
4.37
{% endblock %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v{{self.version().strip()}}/src/nspr-{{self.version().strip()}}.tar.gz
5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa
{% endblock %}

{% block unpack %}
{{super()}}
cd nspr
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_flags %}
--enable-64bit
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/nspr \${CPPFLAGS}"
{% endblock %}

{% block c_rename_symbol %}
poll
{% endblock %}
