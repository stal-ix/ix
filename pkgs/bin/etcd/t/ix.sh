{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.20.tar.gz
{% endblock %}

{% block go_sha %}
72e76d730e43ad726e3031dd099ebdaef411bd7a5e53a1a0b15ea61f35fec85a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
