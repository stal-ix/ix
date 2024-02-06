{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v0.1.7.tar.gz
{% endblock %}

{% block go_sha %}
4ae8ceaf59d871467aef62d64a9642216c8924695f15e440e55b9341a6e49a4b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bluetuith ${out}/bin/
{% endblock %}
