{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/gperftools
{% endblock %}

{% block premain_lang %}c++{% endblock %}

{% block premain_code %}
#include <thread>
#include <unistd.h>

static void threadFunc() {
    while (true) {
        sleep({{delay}});
    }
}

__attribute__((constructor))
static void initTCM() {
    std::thread(threadFunc).detach();
}
{% endblock %}
