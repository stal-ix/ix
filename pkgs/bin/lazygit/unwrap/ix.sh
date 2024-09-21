{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.44.1.tar.gz
{% endblock %}

{% block go_sha %}
dc689cdc4e6f90bfedbb2f913d40d17a09a147c0b4fabf30cfe7cbb8e19f6fdd
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
