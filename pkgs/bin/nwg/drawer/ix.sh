{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.5.tar.gz
{% endblock %}

{% block go_sum %}
sha:bb214d7d008961a8698476cc36dc33a2bfe8868f9303e2091d26dc21e7dcc5e3
{% endblock %}

{% block go_sha %}
sha:e9168bd53d6e7e4015f77cb0d5cdf86cedb26c6d206bbd3f1bc58ca3302fe442
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
