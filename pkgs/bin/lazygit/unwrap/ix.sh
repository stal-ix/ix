{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.51.0
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
754849aa1d56a36364fe6221a6831589a998da4f277b4f84a06cf1a4a9bda977
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
