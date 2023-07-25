{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.42.0.tar.gz
{% endblock %}

{% block go_sha %}
a8975e3e46cbbff37d9306cb374c5a7593d2348bc74ad031f382ad557c6756c6
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
