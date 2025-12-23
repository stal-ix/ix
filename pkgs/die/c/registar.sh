{% extends 'premain.sh' %}

{% set constructors %}
{% block constructors %}
{% endblock %}
{% endset %}

{% block premain_code %}
{% for x in constructors | parse_list %}
void {{x}}(void);
{% endfor %}

{% block definitions %}
{% endblock %}

__attribute__((constructor))
static void construct_{{uniq_id}}() {
{% for x in constructors | parse_list %}
    {{x}}();
{% endfor %}
}
{% endblock %}
