{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230208.tar.gz
sha:654c5328fe732691c9fa2e99144431f86dbbaff1376c73ecc40c245b7906b29f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
