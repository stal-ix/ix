{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.4.22.tar.gz
{% endblock %}

{% block go_sha %}
c8b3cc5444eac371cd31893edce688c2be17b05359e76e21b57c6d92415674bf
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp etcd ${out}/bin/
{% endblock %}
