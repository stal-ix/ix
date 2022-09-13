{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v4.35/src/nspr-4.35.tar.gz
sha:7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f
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
