{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tokei
{% endblock %}

{% block version %}
12.1.2
{% endblock %}

{% block cargo_url %}
https://github.com/XAMPPRocky/tokei/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
49ac3d2dd5a80402438064d6ec6349339fd424fcafa31c368c04591479872da0
{% endblock %}

{% block cargo_bins %}
tokei
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
