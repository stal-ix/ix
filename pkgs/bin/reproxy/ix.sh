{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v1.1.1.tar.gz
{% endblock %}

{% block go_sha %}
5e4b631969e409609c2f7fc5fa8b70b287387854d039c4ea2fefda9565ae96b6
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/reproxy
{% endblock %}
