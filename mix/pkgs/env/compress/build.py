import os


data = r'''
do_untar() {
    case $1 in
        *.zip)
            unzip $1
        ;;
        *)
            pv $1 | bsdcat | bsdtar xf -
        ;;
    esac
}

export untar="do_untar"
export unzip="do_untar"
'''

with open(os.environ['out'] + '/env', 'w') as f:
    f.write(data.strip() + '\n')
