{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-dock/archive/refs/tags/v0.3.1.tar.gz
{% endblock %}

{% block go_sha %}
1a9425a48b43770aa5d24c106b0eea002fb9c299f9fb33773e2e3f7b24a256bd
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-dock ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
