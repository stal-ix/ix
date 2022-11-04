{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-dock/archive/refs/tags/v0.3.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:48e62accbaeabe02a102b9eb6b348fbb4912110fa771760dd337f6740acafd3a
{% endblock %}

{% block go_sha %}
sha:5efdf211fc4cbe8d8008595231908709de3fc93a2eb6227d90e25e167e56e585
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-dock ${out}/bin/
{% endblock %}
