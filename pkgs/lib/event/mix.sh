{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/libevent/libevent/archive/refs/tags/release-2.1.12-stable.tar.gz
0d5a27436bf7ff8253420c8cf09f47ca
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which python3) python
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libevent=${out} \${COFLAGS}"
{% endblock %}
