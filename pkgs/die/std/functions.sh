extract0() (
    if command -v extract; then
        extract 0 ${1}
    else
        {{ix_extract}} ${1}
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
