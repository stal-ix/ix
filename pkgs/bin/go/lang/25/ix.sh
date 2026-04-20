{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.9
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
504e32a42af2d0574d52cf15ce2abf1166c40e1ca1269f1d50bae86a6a047863
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
