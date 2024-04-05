{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v0.2.2.tar.gz
{% endblock %}

{% block go_sha %}
6358041f89a8452e3208d57d5d244791a28a087bd5edf265c769cb9ae31884d2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bluetuith ${out}/bin/
{% endblock %}
