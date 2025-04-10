package com.example.test_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.TelephonyManager
import io.flutter.plugin.common.MethodChannel


class CallReceiver : BroadcastReceiver() {
    companion object {
        var methodChannel:MethodChannel?=null
    }

    override fun onReceive(context: Context, intent: Intent){
        if(intent.action==TelephonyManager.ACTION_PHONE_STATE_CHANGED){
            val state=intent.getStringExtra(TelephonyManager.EXTRA_STATE)
            val incomingNumber=intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER)

            if(state== TelephonyManager.EXTRA_STATE_RINGING && incomingNumber !=null){
                methodChannel?.invokeMethod("incomingCall",incomingNumber)
            }
        }
    }
}