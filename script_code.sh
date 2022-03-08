flutter packages pub get

FIREBASE_PROJECT="SampleTestProjectFlutter" # <-- update with the name of your firebase project
GCLOUD_KEY_FILE= "/Users/pthangella/Documents/jsonbase64Documents/sampletestprojectflutter-0134d12492cc.json" ## <-- update with the path to your gcloud key file

cd .. && rm -rf build

flutter build apk --debug

TARGET_DIR="$(pwd)/integration_test/app_test.dart"

pushd android
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=$TARGET_DIR
popd

gcloud auth activate-service-account --key-file=$GCLOUD_KEY_FILE
gcloud --quiet config set project $FIREBASE_PROJECT

gcloud firebase test android run \
--type instrumentation \
--app build/app/outputs/apk/debug/app-debug.apk \
--test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
--timeout 3m