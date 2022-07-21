{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.65.tar.gz
sha:60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/openssl
{% endblock %}
