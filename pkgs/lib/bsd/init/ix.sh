{% extends '//die/c/registar.sh' %}

{% block lib_deps %}
lib/bsd
{% endblock %}

{% block constructors %}
ix_setproctitle_init
{% endblock %}

{% block definitions %}
char* getprogname();
void setproctitle_init(int, char**, char**);

void ix_setproctitle_init() {
    char* args[2];
    args[0] = getprogname();
    args[1] = 0;
    setproctitle_init(1, args, args);
}
{% endblock %}
