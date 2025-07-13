{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.6.2
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e137805a2b192cb0720a480275cf4e539821685d6661c90c01c925188bc44984
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
