{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.7.2
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6cf8f3fbca40e226de744c23eb63ec59b8a68cb22540a7d73bc4e125af775317
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
