{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220928.tar.gz
sha:c804b77de3feb8e31dee2a4c9fb1e9ec24c5a34764e7a2815c88b4ed01650e90
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
