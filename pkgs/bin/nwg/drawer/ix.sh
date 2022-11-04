{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.3.tar.gz
{% endblock %}

{% block go_sum %}
sha:16485bd215e8e5967bb8ae68ff8b5ccfb752d9ccb8b1889a8dac24e7e6de48f9
{% endblock %}

{% block go_sha %}
sha:eb99e5a3b99efb127969fe02ff684d2ff9eebefdefdec4b506377968af332677
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
