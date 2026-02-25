{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.6.8
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
845d68337f000d62be52723f1a4bd2f213f730bd72a637e1000f79ba4a07fdf9
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
