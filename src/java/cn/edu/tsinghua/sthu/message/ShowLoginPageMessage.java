/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

/**
 *
 * @author linangran
 */
public class ShowLoginPageMessage extends BaseMessage{
    private String redirectURL;
    private String publicKey;
    private String modulus;

    public String getRedirectURL() {
	return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
	this.redirectURL = redirectURL;
    }

    public String getPublicKey() {
	return publicKey;
    }

    public void setPublicKey(String publicKey) {
	this.publicKey = publicKey;
    }

    public String getModulus() {
	return modulus;
    }

    public void setModulus(String modulus) {
	this.modulus = modulus;
    }
}
