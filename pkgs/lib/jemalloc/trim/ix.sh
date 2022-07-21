{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/c
lib/jemalloc
{% endblock %}

{% block premain_code %}
#include <jemalloc/jemalloc.h>

__attribute__((constructor))
static void initJEM() {
    bool val = true;
    mallctl("background_thread", 0, 0, &val, sizeof(val));
}
{% endblock %}
