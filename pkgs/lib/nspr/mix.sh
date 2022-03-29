{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_66_RTM/src/nss-3.66-with-nspr-4.30.tar.gz
4addeabd4aedc1d589cc836577938da6
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
