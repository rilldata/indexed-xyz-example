#!/usr/bin/env bash
address_hash=`md5 -qs $1` 
last_chars=${address_hash: (-2)}

echo "indexed.xyz project initializing..."

echo "installing nightly and updating Rill..."
curl -s https://cdn.rilldata.com/install.sh | bash -s -- --nightly

echo "Cloning your indexed.xyz core analysis to indexed-xyz-$last_chars..."
git clone -b updated-analysis https://github.com/indexed-xyz/rill.git indexed-xyz-$last_chars

echo "Personalizing exploration for contract $1..."

for f in ./indexed-xyz-$last_chars/dashboards/*.yaml; do
    sed -i "" -e  "s/{{ address_hash }}/$address_hash/gi" $f
    sed -i "" -e  "s/{{ address }}/$address/gi" $f
    sed -i "" -e  "s/{{ last_chars }}/$last_chars/gi" $f
done

for f in ./indexed-xyz-$last_chars/models/*.sql; do
    sed -i "" -e  "s/{{ address_hash }}/$address_hash/gi" $f
    sed -i "" -e  "s/{{ address }}/$1/gi" $f
    sed -i "" -e  "s/{{ last_chars }}/$last_chars/gi" $f
done

for f in ./indexed-xyz-$last_chars/sources/*.yaml; do
    sed -i "" -e  "s/{{ address_hash }}/$address_hash/gi" $f
    sed -i "" -e  "s/{{ address }}/$1/gi" $f
    sed -i "" -e  "s/{{ last_chars }}/$last_chars/gi" $f
done

sed -i "" -e  "s/{{ address_hash }}/$address_hash/gi" "./indexed-xyz-$last_chars/rill.yaml"
sed -i "" -e  "s/{{ address }}/$1/gi" ./rill.yaml
sed -i "" -e  "s/{{ last_chars }}/$last_chars/gi" "./indexed-xyz-$last_chars/rill.yaml"

echo "Initializing Rill..."
rill start --project="./indexed-xyz-$last_chars/"