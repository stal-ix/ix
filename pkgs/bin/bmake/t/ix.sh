{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240309.tar.gz
sha:4336c5e32a7a4026cb731c7a439d3260129e4cbc0f71024cf3dceac1c5814480
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
