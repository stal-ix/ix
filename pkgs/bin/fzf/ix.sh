{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.42.0.tar.gz
{% endblock %}

{% block go_sha %}
40df2ea002a794ec7a9e4dabb80e03551727a896f865f22c9704d69b9eaadd5e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
