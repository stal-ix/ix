{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kuroko-lang/kuroko/archive/refs/tags/v1.3.0.tar.gz
sha:7a41b0caa9b56c810ee3c5de3aefc6e71b95f4e6a667add92306f7b3e59515bc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
