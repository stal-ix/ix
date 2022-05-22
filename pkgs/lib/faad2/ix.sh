{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/2_10_0.tar.gz
sha:0c6d9636c96f95c7d736f097d418829ced8ec6dbd899cc6cc82b728480a84bfb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
