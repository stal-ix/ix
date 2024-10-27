{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.56.0.tar.gz
{% endblock %}

{% block go_sha %}
b9859a78d4b77367a66a31af83fdbd291ba91e7899a9284cd94080d449131694
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
