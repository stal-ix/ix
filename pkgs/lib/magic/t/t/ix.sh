{% extends '//lib/magic/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
{% if mingw32 %}
lib/pcre/2
{% endif %}
{% endblock %}

{% block bld_libs %}
{{super()}}
{% if mingw32 %}
lib/pcre/2/overlay
lib/shim/fake(lib_name=gnurx)
{% endif %}
{% endblock %}
