{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v0.2.3.tar.gz
{% endblock %}

{% block go_sha %}
2d815d153e0c5ab01911a3031eb185d036d61d241676444711a153fe309c7ce5
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bluetuith ${out}/bin/
{% endblock %}
