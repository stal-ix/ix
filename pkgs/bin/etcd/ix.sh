{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.4.22.tar.gz
{% endblock %}

{% block go_sha %}
f41af4fe4507b1f36a3d898f4f687f91d129e32f9412c876b87ff04c77a611cc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp etcd ${out}/bin/
{% endblock %}
