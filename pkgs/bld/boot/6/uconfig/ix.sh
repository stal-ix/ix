{% extends '//bin/u/config/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/env/std
{% endblock %}

{% block env %}
export PKG_CONFIG=${out}/bin/pkg-config
{% endblock %}
