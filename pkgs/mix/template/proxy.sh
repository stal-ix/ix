{% extends 'std/mix.sh' %}

{% block script_init_env %}
set +u # TODO(pg): relax
{% endblock %}

{% block decompressor %}
{% endblock %}

{% block step_setup %}
source_env "${MIX_T_DIR}"
{% endblock %}

{% block step_unpack %}
echo 'skip unpack'
{% endblock %}
