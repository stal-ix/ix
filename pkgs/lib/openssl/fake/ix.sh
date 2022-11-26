{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/shim/fake(lib_name=ssl)
lib/shim/fake(lib_name=crypto)
{% endblock %}

{% block bld_tool %}
bld/genpc
{% endblock %}

{% block install %}
genpc "openssl" "1.1.1"
{% endblock %}

{% block env %}
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=${out} \${COFLAGS}"
{% endblock %}
