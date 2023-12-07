{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.11.tar.gz
{% endblock %}

{% block go_sha %}
c85e808c4439a9683c8529a093f499dc67463c8c9a99bfed0f7dbd634cf70cda
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
