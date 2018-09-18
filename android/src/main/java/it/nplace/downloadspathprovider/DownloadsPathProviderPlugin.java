package it.nplace.downloadspathprovider;

import android.os.Environment;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * DownloadsPathProviderPlugin
 */
public class DownloadsPathProviderPlugin implements MethodCallHandler {
    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "downloads_path_provider");
        channel.setMethodCallHandler(new DownloadsPathProviderPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getDownloadsDirectory")) {
            result.success(getDownloadsDirectory());
        } else {
            result.notImplemented();
        }
    }

    private String getDownloadsDirectory() {
        return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getAbsolutePath();
    }

}
