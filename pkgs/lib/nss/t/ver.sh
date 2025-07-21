{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.114
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1
{% endblock %}
