{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/release-1.7.1.tar.gz
a84a680e92618b8c236626c192e5a15b
{% endblock %}

{% block lib_deps %}
lib/openssl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1.16.3/mix.sh
{% endblock %}

{% block configure_flags %}
--with-drill
{% endblock %}

{% block env %}
export COFLAGS="--with-ldns=${out} \${COFLAGS}"
{% endblock %}
