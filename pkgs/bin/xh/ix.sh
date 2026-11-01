{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
xh
{% endblock %}

{% block version %}
0.26.3
{% endblock %}

{% block cargo_url %}
https://github.com/ducaale/xh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
126b6da48c73fce882c99cf57c28bb929e2e5ba16e12037e89ebc205174530ce
{% endblock %}

{% block bld_libs %}
lib/c
lib/oniguruma
{% endblock %}

{% block cargo_features %}
rustls
{% endblock %}

{% block cargo_bins %}
xh
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
