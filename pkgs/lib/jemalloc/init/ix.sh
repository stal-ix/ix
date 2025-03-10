{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/c
lib/jemalloc
{% endblock %}

{% block premain_code %}
void je_zone_register();

__attribute__((constructor))
static void initZONE() {
    je_zone_register();
}
{% endblock %}
