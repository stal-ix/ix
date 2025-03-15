{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/tcmalloc
{% endblock %}

{% block premain_lang %}c++{% endblock %}

{% block premain_code %}
#include <thread>
#include <stdlib.h>
#include <unistd.h>

extern "C" size_t MallocExtension_Internal_ReleaseMemoryToSystem(size_t bytes);

static void threadFunc() {
    while (true) {
        sleep({{delay}});
        MallocExtension_Internal_ReleaseMemoryToSystem({{bytes}});
    }
}

__attribute__((constructor))
static void initTCM() {
    std::thread(threadFunc).detach();
}
{% endblock %}
