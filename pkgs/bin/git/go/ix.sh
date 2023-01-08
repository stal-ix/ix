{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v5.4.2.tar.gz
{% endblock %}

{% block go_sum %}
sha:bbdb5f61f027fb949f4091160e26af07c62ca80089b6efbb4d524c69158bbdcf
{% endblock %}

{% block go_sha %}
sha:f1a671a75fc3edc9b57910fc1d3f2018868d7e0fd0b779d6907af60f05732219
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-git ${out}/bin/
{% endblock %}
