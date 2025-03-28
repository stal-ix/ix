{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.21.tar.gz
{% endblock %}

{% block go_sha %}
7fe8b7346312b96bb787c4b83bd370a66edc333608dca888f87c84cc2d3c9f3f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
