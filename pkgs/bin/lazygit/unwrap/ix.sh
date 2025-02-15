{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.46.0.tar.gz
{% endblock %}

{% block go_sha %}
ddd068f64aab3ad0ecc537822bb5c50ab8609e0c01fc1324d7ad67688f1ed72e
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
