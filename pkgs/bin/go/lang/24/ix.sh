{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.4
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
sha:0ffcfbfb5cf7f29c7fe5383550f1212c577c4d8cb29d1470432f76e9859bd4c0
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
