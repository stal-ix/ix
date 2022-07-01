{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/fukuchi/libqrencode/archive/refs/tags/v4.1.1.tar.gz
sha:5385bc1b8c2f20f3b91d258bf8ccc8cf62023935df2d2676b5b67049f31a049c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
