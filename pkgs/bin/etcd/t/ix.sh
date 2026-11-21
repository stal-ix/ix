{% extends '//die/go/build.sh' %}

{% block pkg_name %}
etcd
{% endblock %}

{% block version %}
3.7.4
{% endblock %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e50c562c39521b777620c53de8f52a26c19e12ba28793252371ad053de467f7b
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
