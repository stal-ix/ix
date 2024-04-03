{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.2.tar.gz
sha:14b6790132eb63a02be3a33f556028dbe33c4d923df099976de8bd02be232be7
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
