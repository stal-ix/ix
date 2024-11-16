{% extends 'ix1.sh' %}

{% block script_functions %}
{{super()}}
setup_host_tc_f() {
{% block setup_host_tc %}
{% endblock %}
}
setup_target_tc_f() {
{% block setup_target_tc %}
{% endblock %}
}
{% endblock %}

{% block setup_compiler %}
setup_host_tc_f
setup_target_tc_f
{% endblock %}
