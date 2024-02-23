{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.12.tar.gz
{% endblock %}

{% block go_sha %}
c7dd09d7dfdc214d0a862f8b160819087c436f17cb809b7215a44b1919b7e107
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
