{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230101.tar.gz
sha:0150300a8c644b876eee57822a872cd84f060983c9006643ead0e75cedc3e904
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
