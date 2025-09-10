{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.1
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
765a18d20549c150307fd150c9c1cfa5fbd6192118ca42a3630ddc7845974b14
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
