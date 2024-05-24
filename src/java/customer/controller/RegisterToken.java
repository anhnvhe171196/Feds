/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package customer.controller;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import vn.fpt.edu.googleconstants.IconstantForRegister;
import vn.fpt.edu.models.GoogleAcount;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
/**
 *
 * @author admin
 */

public class RegisterToken {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(IconstantForRegister.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form()
       .add("client_id", IconstantForRegister.GOOGLE_CLIENT_ID)
                        .add("client_secret", IconstantForRegister.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", IconstantForRegister.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", IconstantForRegister.GOOGLE_GRANT_TYPE)
                        .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
    
    public static GoogleAcount getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = IconstantForRegister.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleAcount googlePojo = new Gson().fromJson(response, GoogleAcount.class);
        return googlePojo;
    }
}
