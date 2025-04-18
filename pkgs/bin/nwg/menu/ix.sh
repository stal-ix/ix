{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-menu
{% endblock %}

{% block version %}
0.1.7
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7c36dbc69368f49e964e4e9637b0cd08e3b5944e892a1d550052873316e3e60e
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
