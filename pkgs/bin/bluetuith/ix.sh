{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v0.1.7.tar.gz
{% endblock %}

{% block go_sha %}
6856a3b9d4e4bcc944d28dbbd6ed9747400e2a7752b4df5a65be792d9c0058fc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bluetuith ${out}/bin/
{% endblock %}
