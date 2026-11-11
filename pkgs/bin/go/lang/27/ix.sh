{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.27.4
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
89c2891539e2d372572836ede46d5073d54f356cba062cc0b39c1fffaf724a89
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/26
{% endblock %}
