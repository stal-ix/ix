{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v0.145.0.tar.gz
{% endblock %}

{% block go_sha %}
e27b3e243580537e2f6b0644d6785ab8d25c74634f2e01ac7a807f0eb92d97bf
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp hugo ${out}/bin/
{% endblock %}
