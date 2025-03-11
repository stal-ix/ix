{% extends '//bin/go/lang/22/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.24.1.tar.gz
sha:61ec6c10add65b3caf4a58000571e7379a60927cd17998abf22e01adf3e52c35
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
