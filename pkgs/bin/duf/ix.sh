{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sha %}
60b9cded0d9be9c4de65cebb2b424db97e18cd1f2a738e6dd9f2941685e932a6
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}
