{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/refs/tags/v0.26.0.tar.gz
{% endblock %}

{% block cargo_sha %}
8c3536ffab0d1ba98421f79e726376b0d949ba98f5789cf76eb5a38140fd3669
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/miniserve ${out}/bin/
{% endblock %}
