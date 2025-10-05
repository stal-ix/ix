{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.117
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996
{% endblock %}
