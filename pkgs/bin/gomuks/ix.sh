{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v0.3.0.tar.gz
{% endblock %}

{% block go_sha %}
ae2f5127240591b4cce5be481bd857762dfb7e7e0bb77554e1a99340594c564b
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gomuks ${out}/bin/
{% endblock %}
