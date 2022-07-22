{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/go-git/go-git/archive/refs/tags/v5.4.2.tar.gz
sha:bbdb5f61f027fb949f4091160e26af07c62ca80089b6efbb4d524c69158bbdcf
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-git ${out}/bin/
{% endblock %}
