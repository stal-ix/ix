{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nspr
{% endblock %}

{% block version %}
4.38.2
{% endblock %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v{{self.version().strip()}}/src/nspr-{{self.version().strip()}}.tar.gz
e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105
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
