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
