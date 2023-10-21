{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pciutils
{% endblock %}

{% block export_libs %}
libpci.a
{% endblock %}

{% block export_lib %}
pci
{% endblock %}
