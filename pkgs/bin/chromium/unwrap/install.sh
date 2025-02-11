set -xue

cd ${1}

mkdir -p ${2}/bin/bin_chromium

cp \
    chrome \
    chrome-wrapper \
    chrome_sandbox \
    chrome_crashpad_handler \
    xdg-mime \
    xdg-settings \
    *.pak \
    *.bin \
    ${2}/bin/bin_chromium/

cp -R locales ${2}/bin/bin_chromium/
cp -R resources ${2}/bin/bin_chromium/

ln -s bin_chromium/chrome ${2}/bin/chrome
