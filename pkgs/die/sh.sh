{% extends 'sh2.sh' %}

{% block script_functions %}
{{super()}}

main_f() {
    source_env "${IX_B_DIR}"

    fast_rm 1 ${out}
    mkdir -p ${out}

    fast_rm 2 ${tmp}
    mkdir -p ${tmp}

    cd ${tmp}
    mkdir tmp

(
{% block sh_script %}
{% endblock %}
)

{% block fix_mtime  %}
    find ${out} -type f | while read l; do
        touch -t 200001010000.00 "${l}"
    done
{% endblock %}

{% block chmod_ro %}
    find ${out} | sort -r | while read l; do
        chmod a-w "${l}" || rm "${l}"
    done

    chmod +w ${out}
{% endblock %}

{% if simulate_failure %}
    exit 1
{% endif %}
{% if not skipsrc %}
    fast_rm 3 ${tmp}
{% endif %}
}
{% endblock %}

{% block script_main %}
main_f
{% endblock %}
