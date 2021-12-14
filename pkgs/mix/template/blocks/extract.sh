do_extract() {
    case $1 in
    *.zip)
        if command -v unzip; then
            unzip $1
        else
            ${exe} ${mix} misc unzip $1
        fi
        ;;
    *)
        if command -v pv; then
            pv $1 | bsdcat | bsdtar xf -
        else
            ${exe} ${mix} misc untar $1
        fi
        ;;
    esac
}

export untar="do_extract"
export unzip="do_extract"
