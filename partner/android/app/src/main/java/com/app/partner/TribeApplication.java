package com.app.partner;

import io.flutter.app.FlutterApplication;
import android.content.Context;
import  androidx.multidex.MultiDex;

public class TribeApplication extends FlutterApplication {
    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
}