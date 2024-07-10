{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.4.9.tar.gz
{% endblock %}

{% block go_sha %}
1c3e466aff9b667d9f75decc4cf883dec73eb35292bffc60cbcda4de4d936963
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
