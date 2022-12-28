{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jirka-h/haveged/archive/refs/tags/v1.9.18.tar.gz
sha:b835fa02b52ee7d06276e028571cadcb14d08f5e5a4b5767adf81451f70561c7
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
