{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v1.6.2.tar.gz
{% endblock %}

{% block go_sha %}
95ea5b367c3c4b098553f29e1a95e3b9a2a8331d61267d3b11593a11aad89575
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp walk ${out}/bin/
{% endblock %}
