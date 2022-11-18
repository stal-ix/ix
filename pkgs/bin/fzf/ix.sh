{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.35.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:d59ec6f2b6e95dad53bb81f758471e066c657be1b696f2fe569e1a9265dda8fe
{% endblock %}

{% block go_sha %}
sha:f41b46334dc92fe725911b50eab1201e98c5e94eb0285191902d7a05f94c7056
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
