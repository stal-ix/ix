{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/3.0.0.tar.gz
{% endblock %}

{% block cargo_sha %}
446bf55b04560da472e7cdf14c042328828b23adc17be84911114aeaaca48d3e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/tspin ${out}/bin/
{% endblock %}
