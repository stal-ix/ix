{% extends 'std/mix.sh' %}

{% block decompressor %}
{% endblock %}

{% block step_setup %}
source_env "${MIX_T_DIR}"
{% endblock %}

{% block step_unpack %}
echo 'nothing to unpack'
{% endblock %}
