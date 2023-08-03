REPOSITORY_NAME=$1
[ -z $REPOSITORY_NAME ] && exit 1

cat slide.md | \
  sed "s/{{REPOSITORY_NAME}}/${REPOSITORY_NAME}/g" | \
  sed "s/{{YEAR}}/$(date +%Y)/g" \
  > dist/README.md
qrencode -o dist/kaosfield-qr.svg -t SVG https://www.kaosfield.net/
qrencode -o dist/gh-pages-qr.svg -t SVG https://kaosf.github.io/${REPOSITORY_NAME}
