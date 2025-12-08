BASE_DIR=$(pwd)
mkdir -p bundle
cd validation
rm -f bundle.tar.gz
rm -f bundle/bundle.tar.gz
opa fmt -w .
opa test .
opa build  --ignore tests --ignore input.json --output $BASE_DIR/bundle/bundle.tar.gz . 
opa build  --ignore tests --ignore input.json --output $BASE_DIR/docs/bundle.tar.gz . 