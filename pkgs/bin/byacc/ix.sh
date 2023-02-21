{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20230219.tgz
sha:36b972a6d4ae97584dd186925fbbc397d26cb20632a76c2f52ac7653cd081b58
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
