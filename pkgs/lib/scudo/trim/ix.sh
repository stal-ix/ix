{% extends '//die/premain.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/scudo
{% endblock %}

{% block premain_lang %}c++{% endblock %}

{% block premain_code %}
#include <thread>
#include <unistd.h>
#include <scudo/interface.h>

extern "C" int mallopt(int param, int value);

static void threadFunc() {
    while (true) {
        sleep({{delay}});
        mallopt(M_PURGE, 1);
    }
}

__attribute__((constructor))
static void initSCUDO() {
    std::thread(threadFunc).detach();
}
{% endblock %}
