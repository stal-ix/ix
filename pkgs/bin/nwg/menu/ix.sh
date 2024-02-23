{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v0.1.1.tar.gz
{% endblock %}

{% block go_sha %}
a03a4c7a12cdaca6d2d97400d8dbc44df8eebd21f5a3a8bb66f0b763a87c2941
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
