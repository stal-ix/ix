{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.7.3
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
77d28ee3fc1cf4c01cef168b682cbba787b76d1b31d94092732d4dacb06a68a6
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
