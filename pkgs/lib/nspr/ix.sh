{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nspr
{% endblock %}

{% block version %}
4.40
{% endblock %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v{{self.version().strip()}}/src/nspr-{{self.version().strip()}}.tar.gz
c0c1884c627f3db7a783f7c7314c695226b2043696791d15519e7e0578c19bdc
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
