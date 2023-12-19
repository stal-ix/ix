{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-3.1.4-quic1.tar.gz
sha:4bf990243d6aa39b8befa0c399834415842912ef67f88bef98e74dc619469618
{% endblock %}

{% block lib_deps %}
{{super()}}
{% if mingw32 %}
lib/shim/dll(dll_name=advapi32)
lib/shim/dll(dll_name=user32)
{% endif %}
{% endblock %}

{% block openssl_conf_opts %}
--libdir=${out}/lib
no-makedepend
{% endblock %}

{% block env %}
{{super()}}
export ac_cv_working_openssl_hashlib=yes
export ac_cv_working_openssl_ssl=yes
{% endblock %}
