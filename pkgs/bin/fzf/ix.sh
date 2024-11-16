{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.56.3.tar.gz
{% endblock %}

{% block go_sha %}
10b1b559587db531b423e0ebecc711a0dcd86ae73b64bbf4fd81418a0d851d8a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
