{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/pam
lib/pam/unix
{% endblock %}

{% block export_libs %}
${lib_pam_unix}/lib/libpam_unix.a
{% endblock %}

{% block export_lib %}
pam_unix
{% endblock %}
