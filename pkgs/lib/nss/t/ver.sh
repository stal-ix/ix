{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.112
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68
{% endblock %}
