{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/r53/inih-r53.tar.gz
sha:01b0366fdfdf6363efc070c2f856f1afa33e7a6546548bada5456ad94a516241
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
