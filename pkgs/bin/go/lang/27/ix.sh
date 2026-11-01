{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.27.3
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
79c0fe60909817414323a8973e51e531de087bdafa06db8101f45d24155f6ac3
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/26
{% endblock %}
