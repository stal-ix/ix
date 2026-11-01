{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.14
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
16cd628b08b124daab3d7957c64472db4e2149e7387a183027da8fb7a2e155f8
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
