{% extends '//mix/template/registar.sh' %}

{% block lib_deps %}
lib/glib/networking/orig
{% endblock %}

{% block constructors %}
g_object_init
_g_io_modules_ensure_loaded
_g_tls_backend_gnutls_register
{% endblock %}

{% block definitions %}
void g_tls_backend_gnutls_register(void*);

void _g_tls_backend_gnutls_register() {
    g_tls_backend_gnutls_register(0);
}
{% endblock %}
