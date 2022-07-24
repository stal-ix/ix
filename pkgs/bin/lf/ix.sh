{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/gokcehan/lf/archive/refs/tags/r27.tar.gz
sha:cdd132e33387423ef9f9448e21d3f1e5c9a5319b34fdfb53cb5f49351ebac005
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}
