{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.18.tar.gz
{% endblock %}

{% block go_sha %}
61f4f7a203f4201b960c777cb412ef728426e4cfb9d0cecb3024103507411186
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
