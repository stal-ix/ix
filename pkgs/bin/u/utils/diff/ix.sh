{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/diffutils/archive/refs/tags/v0.4.2.tar.gz
{% endblock %}

{% block cargo_sha %}
7485816a64e69842fcd22c7a0d12475ae318c2ec5e087510ada67a7017a481ba
{% endblock %}

{% block cargo_bins %}
diffutils
{% endblock %}
