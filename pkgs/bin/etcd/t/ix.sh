{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.16.tar.gz
{% endblock %}

{% block go_sha %}
7f2d6730835b4d614fa62d5aeb218a2714511fb095257813103668431bb3b48a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
