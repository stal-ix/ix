{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v0.1.1.tar.gz
{% endblock %}

{% block go_sha %}
db511009ace82f4bc945541566d71f1cf50298da2b20fcfd2b3cde64370e9ca8
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
