{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.8.tar.gz
sha:fd394ef5038312749d0b3dab8fa0c8079cfdecf4f654cff303d94bcb662559ac
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
