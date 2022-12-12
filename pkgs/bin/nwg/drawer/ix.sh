{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.6.tar.gz
{% endblock %}

{% block go_sum %}
sha:a2c1fe63b905dbe91afd231c92fe78086d3f916363663751b646e6e9faefba49
{% endblock %}

{% block go_sha %}
sha:271d33914a8cc258979529cff9c496003f7179d016e8c21237a27561e9759e60
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
