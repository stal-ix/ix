{% extends '//util/template.sh' %}

{% block more_deps %}
# bld dev/lang/python/libs
# bld dev/build/make tool/compress/upx env/std
{% endblock %}

{% block build %}
(
    set -eu

    cat << EOF
{% block extra_modules %}
{% endblock %}
EOF

{% block more_modules %}
{% endblock %}

    IFS=":"; for l in ${PYTHONPATH}; do
        p="${l}/exports"

        if test -f ${p}; then
            cat ${p}
        fi
    done
) | sort | uniq > modules

python3 $(dirname $(which python3))/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)
make CC=clang -j ${make_thrs}
strip {{self.bin()}}
upx {{self.bin()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp {{self.bin()}} ${out}/bin/
{% endblock %}
