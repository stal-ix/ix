{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,--defsym=dri_loader_get_extensions=abort ${LDFLAGS}"
{% endblock %}
