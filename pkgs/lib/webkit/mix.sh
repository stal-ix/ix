{% extends '//mix/registar.sh' %}

{% block lib_deps %}
lib/webkit/orig
{% endblock %}

{% block constructors %}
InspectorGResourceBundle_get_resource
WebKitResourcesGResourceBundle_get_resource
{% endblock %}
