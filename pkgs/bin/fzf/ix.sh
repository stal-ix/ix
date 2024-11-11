{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.56.2.tar.gz
{% endblock %}

{% block go_sha %}
a43dea7fe7aef0bf406354798b3cfd091484e43fc0c6d2e335ae8bb67bf16086
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
