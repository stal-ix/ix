{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/nss/unwrap
{% endblock %}

{% block premain_code %}
#include <stdlib.h>

extern int RNG_RNGInit();
extern int pk11_setGlobalOptions(int, int, int);

__attribute__ ((__constructor__))
void init_nss(void) {
    if (pk11_setGlobalOptions(0, 1, 0)) {
        abort();
    }

    if (RNG_RNGInit()) {
        abort();
    }
}
{% endblock %}
