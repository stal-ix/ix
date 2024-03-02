{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mdns2dns/archive/refs/tags/v1.tar.gz
{% endblock %}

{% block go_sha %}
d215064bfa78522a7b2618db976a1b396ea32014cfedf079951c203fae317c74
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mdns2dns ${out}/bin/
{% endblock %}
