{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.39.4.tar.gz
{% endblock %}

{% block go_sha %}
83431a770c6fc604b2ad7c57c1b8c5c1bdc71047cb07c713dc357166284a999c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
