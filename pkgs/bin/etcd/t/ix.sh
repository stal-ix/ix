{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.13.tar.gz
{% endblock %}

{% block go_sha %}
e85ae91ef90e646fa4b619d74690aabf6e56b6f1b8475242c803314c99b38c0a
{% endblock %}

{% block go_version %}
v3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
