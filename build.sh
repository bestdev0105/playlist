PROJ_PATH="/Users/miroslaw/Documents/sources/android/playlist"

cd $PROJ_PATH
cordova build android --release

# SIGNING
# keytool -genkey -v -keystore android.keystore -alias android-app-key -keyalg RSA -keysize 2048 -validity 10000
cd $PROJ_PATH/platforms/android/app/build/outputs/apk/release
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore android.keystore app-release-unsigned.apk android-app-key

file="$PROJ_PATH/app-release.apk"
# if exists remove old file
[ -f $file ] && rm $file
# optimize file for google
$ANDROID_HOME/build-tools/28.0.3/zipalign -v 4 app-release-unsigned.apk $file
