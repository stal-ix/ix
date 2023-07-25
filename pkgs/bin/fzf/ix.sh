{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.42.0.tar.gz
{% endblock %}

{% block go_sha %}
sha:702198f6bbde97a0aa3b876fd019bb98c2864941a41d75cfe5f2a6dec3fa8ebf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
