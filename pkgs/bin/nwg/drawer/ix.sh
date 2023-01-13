{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.7.tar.gz
{% endblock %}

{% block go_sum %}
sha:083df513265cab03095461e8e0e8582efb917690ddad572959dd00972ca0abd1
{% endblock %}

{% block go_sha %}
sha:1cd17354a04aab0f78900d13294a707494c7f9c7dc284deb5410c379f4d1d183
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
