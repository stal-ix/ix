{% extends 'premain.sh' %}

{% set constructors %}
{% block constructors %}
{% endblock %}
{% endset %}

{% block premain_code %}
{% for x in mix.parse_list(constructors) %}
void {{x}}(void);
{% endfor %}

{% block definitions %}
{% endblock %}

__attribute__((constructor))
static void construct_{{uniq_id}}() {
{% for x in mix.parse_list(constructors) %}
    {{x}}();
{% endfor %}
}
{% endblock %}
