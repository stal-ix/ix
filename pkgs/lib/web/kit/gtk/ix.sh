{% extends '//die/c/registar.sh' %}

{% block lib_deps %}
lib/web/kit/gtk/orig
{% endblock %}

{% block constructors %}
InspectorGResourceBundle_get_resource
WebKitResourcesGResourceBundle_get_resource
{% endblock %}
