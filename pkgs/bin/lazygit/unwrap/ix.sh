{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.42.0.tar.gz
{% endblock %}

{% block go_sha %}
4a609972214dddc9be5895b1996889ab8c9963e901886886a5b92126931ee824
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
