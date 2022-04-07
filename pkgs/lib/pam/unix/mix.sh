{% extends '//mix/dl/fix.sh' %}

{% block lib_deps %}
lib/pam
lib/pam/unix/module
{% endblock %}

{% block export_symbols %}
pam_sm_acct_mgmt
pam_sm_authenticate
pam_sm_setcred
pam_sm_chauthtok
pam_sm_close_session
pam_sm_open_session
{% endblock %}

{% block export_lib %}
pam_unix
{% endblock %}
