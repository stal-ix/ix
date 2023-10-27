{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.10.tar.gz
{% endblock %}

{% block go_sha %}
1cb0b0b969101e127d1f6dd8be66a6a14640da16a4b0f532bd9bf902a89bd20b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd server
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp server ${out}/bin/etcd
{% endblock %}
