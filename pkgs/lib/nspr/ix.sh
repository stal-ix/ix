{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v4.34/src/nspr-4.34.tar.gz
sha:beef011cd15d8f40794984d17014366513cec5719bf1a78f5e8a3e3a1cebf99c
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

{% block env_lib %}
export CPPFLAGS="-I${out}/include/nspr \${CPPFLAGS}"
{% endblock %}

{% block c_rename_symbol %}
poll
{% endblock %}
