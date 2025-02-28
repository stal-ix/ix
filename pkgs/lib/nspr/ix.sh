{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v4.36/src/nspr-4.36.tar.gz
sha:55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f1c6895
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
