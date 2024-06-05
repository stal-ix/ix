{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.4.tar.gz
sha:8e035e7418ae53a20a4c9eedc906e5c43e8c31f5bfc044d2f9f70dc409cd88b1
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
