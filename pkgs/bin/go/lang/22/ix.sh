{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.5.tar.gz
sha:7943adac83b278f5171fbf94cd29c062a726f0adc10cb3891e1804f542444a51
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
