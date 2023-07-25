{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.39.4.tar.gz
{% endblock %}

{% block go_sha %}
5d2b311b2a07a8a98c9bd22cceaf4a4ebe94a754969bc5ab09060a0f8774ad98
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
