{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v0.1.1.tar.gz
{% endblock %}

{% block go_sha %}
9703d287d3d44c2bd16e85fd6f2ed7d14d3e67bfa261bf5c03d8c8caa6fade90
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
