{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.47.1.tar.gz
{% endblock %}

{% block go_sha %}
50a6f535f7b5e4082cac48a3bbab7a201df761422a39cd2c1d9154c8165a9f78
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
