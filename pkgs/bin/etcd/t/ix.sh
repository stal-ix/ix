{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.12.tar.gz
{% endblock %}

{% block go_sha %}
0ee53a376f2d4cf28ddcda15b4fd278e0c8aa5e3432683a673a296f31036f305
{% endblock %}

{% block go_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
