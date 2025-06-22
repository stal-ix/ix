{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
yazi
{% endblock %}

{% block version %}
25.5.31
{% endblock %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3d54aeef8977387f164dcfb88f13b44cf5e604b65bc298478c19c96fffdfa21e
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block unpack %}
{{super()}}
cd yazi-fm
{% endblock %}

{% block cargo_bins %}
yazi
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
