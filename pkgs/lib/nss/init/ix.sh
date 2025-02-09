{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/nss/unwrap
{% endblock %}

{% block premain_code %}
#include <stdlib.h>

extern int RNG_RNGInit();

__attribute__ ((__constructor__))
void init_nss(void) {
    if (RNG_RNGInit()) {
        abort();
    }
}
{% endblock %}
