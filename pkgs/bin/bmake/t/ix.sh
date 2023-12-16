{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20231210.tar.gz
sha:1d44f4cb9fa95cc5bfb663553f5a0d041e135e4de167b7c79582b24ca54fbaed
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
