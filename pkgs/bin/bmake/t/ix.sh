{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230303.tar.gz
sha:e8698724ac68c63f8e6682a93c3154c1d93dc6a9072f13c8cef07ece4ccd0ed6
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
