{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/antonmedv/llama/archive/refs/tags/v1.2.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:cf6fe219f2554c90aadbe4d0ebb961b53fe3296873addab1a3af941646e19ca2
{% endblock %}

{% block go_sha %}
sha:75608e519ec0cbacf6ed338e0a63fd7e1bac2f99287a71638ee51d4a11356399
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp llama ${out}/bin/
{% endblock %}
