{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.6.tar.gz
sha:71cbf4f555da51df93f71b1726c69f2e80f62bbe2e7ce1c5c39c3d57fa385b14
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
