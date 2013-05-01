/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import javamail.MailSenderPool;

/**
 *
 * @author elsie
 */
public class SendEmailService {
    private static MailSenderPool mailSenderPool;

    static {
        mailSenderPool = new MailSenderPool();
        mailSenderPool.start();
    }
       /**
     * @return the mailSenderPool
     */
    public static MailSenderPool getMailSenderPool() {
        return mailSenderPool;
    }

    /**
     * @param mailSenderPool the mailSenderPool to set
     */
    public static void setMailSenderPool(MailSenderPool mailSenderPool) {
        SendEmailService.mailSenderPool = mailSenderPool;
    }
}
