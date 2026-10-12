{% extends '//die/gen.sh' %}

{# Import the existing local build; it is not a downloadable public source. #}
{% block use_isolate %}false{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp /home/pg/arc-musl/arc ${out}/bin/arc
chmod 0755 ${out}/bin/arc
echo '04d269d8381a022e20bc19e128d9000865ffdc8eed5a481b905f94b14d0b33f2  '${out}/bin/arc | sha256sum -c -
{% endblock %}
