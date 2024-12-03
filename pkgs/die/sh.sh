{% extends 'sh2.sh' %}

{% block script_functions %}
{{super()}}

source_env() {
    OFS=${IFS}; IFS=':'; for x in ${1}; do
        IFS=${OFS}; . "${x}/env"; IFS=':'
    done; IFS=${OFS}
}

fast_rm() (
    mv "${2}" "{{trash_dir}}/${IX_RANDOM}_${1}" || rm -rf "${2}"
)

prepare_f() {
    source_env "${IX_B_DIR}"

    fast_rm 1 ${out}
    mkdir -p ${out}

    fast_rm 2 ${tmp}
    mkdir -p ${tmp}

    cd ${tmp}
    mkdir tmp
}

fix_mtime_f() (
{% block fix_mtime  %}
    find ${out} -type f | while read l; do
        touch -t 200001010000.00 "${l}"
    done
{% endblock %}
)

chmod_ro_f() (
{% block chmod_ro %}
    find ${out} | sort -r | while read l; do
        chmod a-w "${l}" || rm "${l}"
    done

    chmod +w ${out}
{% endblock %}
)

cleanup_f() {
    fix_mtime_f
    chmod_ro_f
{% if simulate_failure %}
    exit 1
{% endif %}
{% if not skipsrc %}
    fast_rm 3 ${tmp}
{% endif %}
}

script_f() (
{% block sh_script %}
{% endblock %}
)

main_f() {
    prepare_f
    script_f
    cleanup_f
}
{% endblock %}

{% block script_main %}
{{super()}}
main_f
{% endblock %}
