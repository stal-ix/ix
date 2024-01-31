{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.12.tar.gz
{% endblock %}

{% block go_sha %}
bed2e4571116eba2ca5c16f8f1dac800c25af335b60b36fc13c865e1c7a44a4c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
