{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.7.tar.gz
{% endblock %}

{% block go_sha %}
5c20a618580348ef9d17d66e70974e62b4b60a094737a035dc806cbbe6da6f58
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
