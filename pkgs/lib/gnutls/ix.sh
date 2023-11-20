{% extends '//die/c/registar.sh' %}

{% block lib_deps %}
lib/gnutls/unwrap
{% endblock %}

{% block constructors %}
gnutls_global_init
{% endblock %}
