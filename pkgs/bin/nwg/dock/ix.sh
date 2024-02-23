{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-dock/archive/refs/tags/v0.3.1.tar.gz
{% endblock %}

{% block go_sha %}
c252dcac4603df93cf160babd9797bc1c1cdbcf5b7d6feeeca364b561e488fbc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-dock ${out}/bin/
{% endblock %}
