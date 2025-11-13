{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nspr
{% endblock %}

{% block version %}
4.38
{% endblock %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v{{self.version().strip()}}/src/nspr-{{self.version().strip()}}.tar.gz
72ee73ffcc6ef5e706965f855ecf470ec3986c3e188e12a8a8006e76f6b31a6f
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
