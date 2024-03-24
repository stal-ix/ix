{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.41.0.tar.gz
{% endblock %}

{% block go_sha %}
19b66cede817112971b7424f78d7d2eb9b7dfc828790f4e750e75a3792844f04
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
