{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
yazi
{% endblock %}

{% block version %}
25.5.28
{% endblock %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
bb270e1ed6860edc4bf18a717b4225fdf231ac129523cdb60ab9e94c85050289
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block unpack %}
{{super()}}
cd yazi-fm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/yazi ${out}/bin/
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}

{% block rustc_ver %}
86
{% endblock %}
