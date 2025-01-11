{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.45.0.tar.gz
{% endblock %}

{% block go_sha %}
8fc8bb604b45c7522d6ed8d7aeb62b19c7919bdec2a3492a5f083aee0df06051
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
