{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://git.alpinelinux.org/aports/plain/main/musl/getconf.c
sha:d87d0cbb3690ae2c5d8cc218349fd8278b93855dd625deaf7ae50e320aad247c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
cp ${src}/getconf.c ./
{% endblock %}

{% block build %}
cc -o getconf getconf.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp getconf ${out}/bin/
{% endblock %}
