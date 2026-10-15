{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.130
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
afab9f82c78bfa3e7e8b4a61ac31922675c58203f67ff385a2714df7fe9bd5c5
{% endblock %}
