{% extends '//mix/registar.sh' %}

{% block lib_deps %}
lib/web/kit/orig
{% endblock %}

{% block constructors %}
InspectorGResourceBundle_get_resource
WebKitResourcesGResourceBundle_get_resource
{% endblock %}
