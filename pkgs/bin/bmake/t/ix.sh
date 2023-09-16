{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230909.tar.gz
sha:1e5e6c76540dfe8104426cd7fd3f715cc6404f9039c9203447012b8f2f6b7b86
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
