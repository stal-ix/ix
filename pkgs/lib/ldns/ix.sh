{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/1.8.3.tar.gz
sha:33fb1a77f2de2fca9e749d17256334a3222a9e9d11b31c6d998bd920f3bd6776
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block configure_flags %}
--with-drill
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-ldns=${out} \${COFLAGS}"
{% endblock %}
