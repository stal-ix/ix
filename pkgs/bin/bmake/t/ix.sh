{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230321.tar.gz
sha:ed7d568c08748a2221e19ddc1aebed97dd430ab0c6942304698b1c2363fa8256
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
