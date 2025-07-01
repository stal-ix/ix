{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/udev/{{libudev_ver or 'zero'}}
{% elif freebsd %}
lib/udev/devd
{% else %}
{{error('udev not supported on your os')}}
{% endif %}
{% endblock %}
