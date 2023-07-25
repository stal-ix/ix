{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.39.4.tar.gz
{% endblock %}

{% block go_sha %}
sha:6eb8e1d9c5476d6ea22369382e1065e669158420f69f0dc9e1835207aefd001f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
