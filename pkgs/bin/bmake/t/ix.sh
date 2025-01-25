{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20250120.tar.gz
sha:c0a5549b132fe38580e7bdd3bf4ef6d96164e176d1ac3e7a32522ff0d32643a2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
