BASE_DIR=$(pwd)
mkdir -p bundle
mkdir -p docs
cd validation
rm -f bundle.tar.gz
rm -f bundle/bundle.tar.gz
opa fmt -w .
opa test .
opa build  --ignore tests --ignore input.json --output $BASE_DIR/bundle/bundle.tar.gz .
opa build -t wasm --ignore tests  -e metabolights/validation/v2/report/complete_report -o $BASE_DIR/bundle/mtbls-validation.wasm report.rego .
cp $BASE_DIR/bundle/bundle.tar.gz $BASE_DIR/docs/bundle.tar.gz
cp $BASE_DIR/bundle/mtbls-validation.wasm $BASE_DIR/docs/mtbls-validation.wasm