{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/gopasspw/gopass/archive/refs/tags/v1.14.3.tar.gz
sha:7763f14fe8796b73fe08702a39b53849993659a5a0effe8f361cc3218e713606
{% endblock %}

{% block go_compiler %}
bin/go/19/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gopass ${out}/bin/
{% endblock %}
