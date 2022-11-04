{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v0.1.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:bc286e014eaad39d12aaad71ca48bfe2c93353114263c6fd71a0ab8cf0f2ac02
{% endblock %}

{% block go_sha %}
sha:4bab6977ed8028583a053c8af27ec08033933a84b3ea7e5efb0fe9348598777c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
