{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.60.0.tar.gz
{% endblock %}

{% block go_sha %}
e6458988f7f8af78fdc64c7875cf069bc0902685b6587e235c3d70bb4b7ad785
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
