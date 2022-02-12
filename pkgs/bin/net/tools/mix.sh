{% extends '//mix/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/net-tools/net-tools-2.10.tar.xz
sha:b262435a5241e89bfa51c3cabd5133753952f7a7b7b93f32e08cb9d96f580d69
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
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
