{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.48.0.tar.gz
{% endblock %}

{% block go_sha %}
b966477dbbb54f305fcdab409b9c1c8155d2b9db2e4bf7b011cd3ed8ba927da7
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
