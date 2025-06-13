{% extends '//die/c/make.sh' %}

{% block pkg_name %}
net-tools
{% endblock %}

{% block version %}
2.10
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/net-tools/net-tools-{{self.version().strip()}}.tar.xz
b262435a5241e89bfa51c3cabd5133753952f7a7b7b93f32e08cb9d96f580d69
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block configure %}
yes "" | make config
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
SBINDIR=/bin
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir -p share
mv usr/share/* share/
{% endblock %}
