{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-dock/archive/refs/tags/v0.3.1.tar.gz
{% endblock %}

{% block go_sha %}
772e1dc0fe14ab61342465cdebf32025f4443da18fc74d5faaf429c28630d04c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-dock ${out}/bin/
{% endblock %}
