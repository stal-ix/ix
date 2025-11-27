{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://download.savannah.nongnu.org/releases/fastjar/fastjar-0.98.tar.gz
f156abc5de8658f22ee8f08d7a72c88f9409ebd8c7933e9466b0842afeb2f145
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
{% endblock %}
