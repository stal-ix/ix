{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230510.tar.gz
sha:3510bb41e150591c147e56cf2f1c1e803c3a41c2973d789a61593a3d93ee2d6e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
