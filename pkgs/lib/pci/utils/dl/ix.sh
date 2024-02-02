{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pci/utils
{% endblock %}

{% block export_libs %}
libpci.a
{% endblock %}

{% block export_lib %}
pci
{% endblock %}
