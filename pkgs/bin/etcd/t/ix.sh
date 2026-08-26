{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.7.1
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b2fad291fb45fb3619b3fd0b9cd6e243ba0ccd1967b16b4ae292a7a03d51e52a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
