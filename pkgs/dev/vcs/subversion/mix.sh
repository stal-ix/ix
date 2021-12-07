{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2
2eccc2c7451397e01a13682600af9563
{% endblock %}

{% block bld_libs %}
dev/vcs/subversion/libs/mix.sh(openssl=1)
{% endblock %}

{% block run_deps %}
net/openssh/mix.sh
{% endblock %}

{% block setup %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=${lib_expat_lib}/include:${lib_expat_lib}/lib:-lexpat"
{% endblock %}
