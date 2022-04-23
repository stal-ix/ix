{% extends '//mix/premain.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/gperftools/tcmalloc
{% endblock %}

{% block premain_lang %}c++{% endblock %}

{% block premain_code %}
#include <thread>
#include <unistd.h>

extern "C" void MallocExtension_ReleaseToSystem(size_t numBytes);

static void threadFunc() {
    while (true) {
        sleep({{delay}});
        MallocExtension_ReleaseToSystem({{bytes}});
    }
}

__attribute__((constructor))
static void initTCM() {
    std::thread(threadFunc).detach();
}
{% endblock %}
