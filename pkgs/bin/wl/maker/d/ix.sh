{% extends '//bin/wl/maker/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/drivers/3d
{% endblock %}
