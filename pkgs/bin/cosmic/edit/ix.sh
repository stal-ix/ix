{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-edit/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
85bf6bba0b9d4d076b210f86ec56224aefde39616e404adf37e5b9ad897c6713
{% endblock %}

{% block bld_libs %}
lib/zstd
lib/bzip/2
lib/oniguruma
{{super()}}
{% endblock %}
