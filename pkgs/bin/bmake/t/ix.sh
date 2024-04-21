{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240414.tar.gz
sha:e1ba6c230cb3acf8b4c0885efaf3ffba3905942784b29d0f7fe22201542a5d56
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
