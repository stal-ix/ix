{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.13.tar.gz
{% endblock %}

{% block go_sha %}
5503270ac42e04f5a7c9609d381b90e662af2384981752849d1006d7baa628fb
{% endblock %}

{% block go_version %}
v3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
