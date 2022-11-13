{% extends '//die/c/registar.sh' %}

{% block lib_deps %}
lib/glib/networking/orig
{% endblock %}

{% block constructors %}
gobject_init
_g_io_modules_ensure_loaded
_g_tls_backend_openssl_register
{% endblock %}

{% block definitions %}
void g_tls_backend_openssl_register(void*);

void _g_tls_backend_openssl_register() {
    g_tls_backend_openssl_register(0);
}
{% endblock %}
