{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240722.tar.gz
sha:1654bd0cad284360849669a1e9a993181fed137896aac2694b82ea9a35f709e4
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
