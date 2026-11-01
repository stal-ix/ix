{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.26.10
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
7dd0c24e882dedabb8a653a00533b067c182548ecc6c0d998190b0358929a9b9
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/25
{% endblock %}
