{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.40.0.tar.gz
{% endblock %}

{% block go_sha %}
4ba3ffdacce86ddca1524a26a4515d4e6cf6c20531dfc1678aa1bf52394177b5
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
