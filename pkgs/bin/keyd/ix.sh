{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v2.4.0.tar.gz
sha:100007894ac4fa6e95f5de5c2fe992c8b00e68d9df76c4bcdd8402a29d7b4058
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
