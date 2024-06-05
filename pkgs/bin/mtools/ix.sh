{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.44.tar.lz
sha:e9cd7fff9e107b69a57bcbd59e9ccd76448cd5db0194a2383757e421994b21d7
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
