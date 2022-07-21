{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/rpmalloc
{% endblock %}

{% block premain_lang %}c++{% endblock %}

{% block premain_code %}
#include <thread>
#include <unistd.h>

extern "C" void rpmalloc_thread_collect();

static void threadFunc() {
    while (true) {
        sleep({{delay}});
        rpmalloc_thread_collect();
    }
}

__attribute__((constructor))
static void initRPM() {
    std::thread(threadFunc).detach();
}
{% endblock %}
