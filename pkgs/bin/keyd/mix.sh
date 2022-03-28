{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v2.3.1-rc.tar.gz
sha:3e241a5926dbfdc4bfbbd8d619c347538de3f9dda2229e00486fbbea1f19c708
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block patch %}
(find . -name '*.h' -type f; find . -name '*.c' -type f;) | while read l; do
    sed -e 's|err(|xerr(|' -i ${l}
done
{% endblock %}
