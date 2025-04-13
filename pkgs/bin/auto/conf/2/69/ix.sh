{% extends '//bin/auto/conf/2/71/ix.sh' %}

{% block pkg_name %}
autoconf
{% endblock %}

{% block version %}
2.69
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-{{self.version().strip()}}.tar.xz
sha:64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684
{% endblock %}
