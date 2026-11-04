{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
yazi
{% endblock %}

{% block version %}
26.9.1
{% endblock %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
6fe8cab5d23970d077989be3fe1d848efda513df4e7719d6d8e2c8d3c64739aa
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block c_flags %}
-fPIC
{% endblock %}

{% block unpack %}
{{super()}}
cd yazi-fm
{% endblock %}

{% block cargo_bins %}
yazi
{% endblock %}

{% block build %}
export YAZI_NO_GITCL=1
{{super()}}
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
