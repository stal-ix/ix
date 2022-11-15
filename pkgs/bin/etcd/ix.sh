{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/etcd-io/etcd/archive/refs/tags/v3.4.22.tar.gz
{% endblock %}

{% block go_sha %}
sha:9cb5c48e29d5ea0dfbf0cfc1c0b828cf16e8075138d0935cca8df98ce1bf7196
{% endblock %}

{% block go_sum %}
sha:1fdbf10930c37776e0c7f53605855ef519ca7c7d685ed48939b54f8c14fa661a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp etcd ${out}/bin/
{% endblock %}
