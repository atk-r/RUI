git clone https://github.com/atk-r/RUI
mv RUI/rui rui
rm -rf RUI
npm i @emotion/react @reach/portal @reach/tabs @react-aria/button @react-aria/dialog @react-aria/overlays @react-aria/switch @react-aria/tooltip @react-aria/visually-hidden autosize date-fns downshift is-mobile jotai react-popper react-uid @emotion/babel-plugin --force

BABELRC_FILE=".babelrc"

if [ -f "$BABELRC_FILE" ]; then
    if grep -q "\"plugins\":.*\[@emotion/babel-plugin\]" "$BABELRC_FILE"; then
        :
    else
        sed -i '/"plugins":/ s/\]/, "@emotion\/babel-plugin"\]/' "$BABELRC_FILE"
    fi
else
    echo '{' > "$BABELRC_FILE"
    echo '  "plugins": ["@emotion/babel-plugin"]' >> "$BABELRC_FILE"
    echo '}' >> "$BABELRC_FILE"
fi