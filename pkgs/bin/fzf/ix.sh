{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.39.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:ac665ac269eca320ca9268227142f01b10ad5d25364ff274658b5a9f709a7259
{% endblock %}

{% block go_sha %}
sha:5265178c5313f262902a0018cdd02c4b561c5177d49c97228e5de54f0ef7b0f1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
