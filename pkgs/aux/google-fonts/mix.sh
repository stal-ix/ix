{% extends '//mix/template/std/mix.sh' %}

{% block fetch %}
https://github.com/google/fonts/archive/2855855a4cf481d4220e30ca3bff0704cc111a57.zip
sha:c8dc7e5278c4d31ab5e4778f93e98d04ddcb9b6f7f0b8440382b2b2e251bb197
{% endblock %}

{% block install %}
mkdir -p ${out}/share/fonts

find . -type f -name '*.ttf' | while read l; do
    cp ${l} ${out}/share/fonts/
done
{% endblock %}
