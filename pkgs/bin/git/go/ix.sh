{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v5.4.2.tar.gz
{% endblock %}

{% block go_sum %}
sha:bbdb5f61f027fb949f4091160e26af07c62ca80089b6efbb4d524c69158bbdcf
{% endblock %}

{% block go_sha %}
sha:e09ed69954f655e8abdd78cd375531ac53a54afdb33574db65a55f80294b827a
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-git ${out}/bin/
{% endblock %}
