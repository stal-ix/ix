{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.6.5
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c7ccd12e751f9489ce62d1718beff574c80fc02a4602c11d693529156aff4aa1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
