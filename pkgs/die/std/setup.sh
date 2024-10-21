mkpushd ${tmp}/bin

# setup build tools
mkpushd bt
export PATH="${PWD}:${PATH}"
setup_bt_f
popd

# setup toolchain
mkpushd tc
setup_compiler_f
export PATH="${PWD}:${PATH}"
popd

# setup user tools
mkpushd ut
setup_tools_f
export PATH="${PWD}:${PATH}"
popd

popd
