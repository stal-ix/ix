{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.17.tar.gz
{% endblock %}

{% block go_sha %}
f596d968510cc30a4148fd8fa371f094cff768f36f04e16b3eb7f73bd6e6ad66
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
