{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240909.tar.gz
sha:d4e019e26c64cc8ffcf1cae9bb04fbb13da8fa6f41fb30fd26e221f655d4e84d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
