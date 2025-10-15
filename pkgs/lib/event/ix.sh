{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libevent
{% endblock %}

{% block version %}
2.1.12
{% endblock %}

{% block fetch %}
https://github.com/libevent/libevent/archive/refs/tags/release-{{self.version().strip()}}-stable.tar.gz
7180a979aaa7000e1264da484f712d403fcf7679b1e9212c4e3d09f5c93efc24
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block env %}
export COFLAGS="--with-libevent=${out} \${COFLAGS}"
{% endblock %}

{% block configure_flags %}
--disable-libevent-regress
--disable-samples
{% endblock %}
