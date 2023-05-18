{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.23.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:f6060f11d25942bd28e49e08aee09025be442788604cb645a9e161ed394b2509
{% endblock %}

{% block go_sha %}
sha:c8220bd1f4663f21fdd5b1f5c101dc5308310bf06dccce7b1d75e4b718c7314b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
