{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.47.2.tar.gz
{% endblock %}

{% block go_sha %}
97cb41d498cc3aa61d23d858851918b5b9108c0c02f04e9e3096f8e8483a6eba
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
