/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class com_inventale_coregistration_survey_providers_fm_XLearnProvider */

#ifndef _Included_com_inventale_coregistration_survey_providers_fm_XLearnProvider
#define _Included_com_inventale_coregistration_survey_providers_fm_XLearnProvider
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     com_inventale_coregistration_survey_providers_fm_XLearnProvider
 * Method:    run
 * Signature: ([Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_inventale_coregistration_survey_providers_fm_XLearnProvider_run
        (JNIEnv *, jobject, jobjectArray);

/*
 * Class:     com_inventale_coregistration_survey_providers_fm_XLearnProvider
 * Method:    predict
 * Signature: (Ljava/lang/String;[I[I[IILjava/lang/String;Z)[Lcom/inventale/coregistration/survey/providers/fm/PredictionResult;
 */
JNIEXPORT jobjectArray JNICALL Java_com_inventale_coregistration_survey_providers_fm_XLearnProvider_predict
        (JNIEnv *, jobject, jstring, jintArray, jintArray, jintArray, jint, jstring, jboolean);

#ifdef __cplusplus
}
#endif
#endif