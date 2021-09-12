# url https://files.pythonhosted.org/packages/78/c8/8d9be2f72d8f465461f22b5f199c04f7ada933add4dae6e2468133c17471/Pygments-2.10.0-py3-none-any.whl
# md5 23ad6b4ae954b138728c09d8668f225e
# bld env/std

build() {
    cd $out && $untar $src/*.whl && cat << EOF > $out/env
export PYTHONPATH="$(pwd):\$PYTHONPATH"
EOF
}
