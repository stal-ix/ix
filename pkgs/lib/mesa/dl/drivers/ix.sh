{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/mesa/drivers/{{mesa_driver}}
{% endblock %}

{% block export_libs %}
libgldrivers.a
{% endblock %}

{% block export_lib %}
gldrivers
{% endblock %}
