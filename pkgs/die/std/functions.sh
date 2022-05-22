extract0() (
    if command -v extract; then
        extract 0 ${1}
    else
        {{ix_bin}} misc extract ${1}
    fi
)

extract1() (
    if command -v extract; then
        extract 1 ${1}
    else
        mkdir _; (
            cd _; extract0 ${1}; cd *; mv $(ls -A) ../../
        ); rm -r _
    fi
)

find_pkg() (
    source_env "${IX_T_DIR}"
    pkg-config --variable=prefix ${1}
)

DS="nowhere"

pushd() {
    DS="${PWD}:${DS}"; cd ${1}
}

mkpushd() {
    mkdir ${1}; pushd ${1}
}

pushcwd() {
    pushd ${PWD}
}

popd() {
    O=${IFS}; IFS=':'; set ${DS}; cd ${1}; shift; DS=${*}; IFS=${O}
}
