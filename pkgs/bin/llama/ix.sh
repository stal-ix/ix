{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/antonmedv/llama/archive/refs/tags/v1.4.0.tar.gz
{% endblock %}

{% block go_sha %}
ec37aa877e44b188e96af60d776f7fe11c7398d37b38972e96ac1823fe2c7774
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp llama ${out}/bin/
{% endblock %}
