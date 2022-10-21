{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hanslub42/rlwrap/archive/refs/tags/v0.46.tar.gz
sha:4bc53e96b49405e4a8ca579465bc1129adc719a96840b71b3ae99ec88e4d8c29
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}
