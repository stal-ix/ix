{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libevent/libevent/archive/refs/tags/release-2.1.12-stable.tar.gz
0d5a27436bf7ff8253420c8cf09f47ca
{% endblock %}

{% block lib_deps %}
lib/openssl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
dev/tool/python/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which python3) python
{% endblock %}

{% block env %}
export COFLAGS="--with-libevent=${out} \${COFLAGS}"
{% endblock %}
