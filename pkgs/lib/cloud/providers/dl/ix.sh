{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/cloud/providers
{% endblock %}

{% block export_libs %}
libcloudproviders.a
{% endblock %}

{% block export_lib %}
cloudproviders
{% endblock %}
