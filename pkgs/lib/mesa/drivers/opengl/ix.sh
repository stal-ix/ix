{% extends '//die/dl/fix.sh' %}

{% block export_prefix %}
o_
{% endblock %}

{% block export_symbols %}
__driDriverGetExtensions_{{driver}}
dri_loader_get_extensions
{% endblock %}

{% block export_lib %}
{{driver}}_dri
{% endblock %}
