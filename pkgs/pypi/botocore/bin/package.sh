{% extends '//pypi/botocore/package.sh' %}

{% block postinstall %}
find ${out}/lib | grep \\.py | while read l; do
    sed -e 's|BOTOCORE_ROOT = .*|BOTOCORE_ROOT = ""|' -i ${l}
done
{% endblock %}
