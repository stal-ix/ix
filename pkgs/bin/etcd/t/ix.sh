{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.14.tar.gz
{% endblock %}

{% block go_sha %}
0a8ebc1b43bd73d85b619d2cb5ea3be992d0f333c8c429f1b2e3f0a54db910ce
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
