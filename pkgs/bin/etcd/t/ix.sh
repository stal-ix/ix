{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.6.6
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1b6c317a76a9557fe3c092c699f02dc621e79af19c0812aa533a116d36975b3c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
