{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.57.0.tar.gz
{% endblock %}

{% block go_sha %}
8a89512885ebf43ba7e26eb28eb3038664e7eb18583311c66972a973f07852a8
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
