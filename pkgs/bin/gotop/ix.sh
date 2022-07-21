{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/xxxserxxx/gotop/archive/refs/tags/v4.1.4.tar.gz
sha:9fe5eb25ee253e5679cd0dede0ec6e075d6782442bc3007bb9fea8c44e66b857
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gotop
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gotop ${out}/bin/
{% endblock %}
