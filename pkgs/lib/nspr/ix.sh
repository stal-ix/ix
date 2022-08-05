{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.mozilla.org/pub/nspr/releases/v4.34.1/src/nspr-4.34.1.tar.gz
sha:c5b8354c48b632b8f4c1970628146c0e0c0ca8f32c7315d7d5736c002e03774f
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
