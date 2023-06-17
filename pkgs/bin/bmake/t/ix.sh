{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230601.tar.gz
sha:8d0b2e593946539065530a241040b0b0525ebb2b924ed67fc497ad17845a5a09
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
