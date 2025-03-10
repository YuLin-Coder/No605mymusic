package com.martinwj.mymusic.util;

import java.util.Date;
import java.util.Properties;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 14:08
 * @version: 1.0
 *
 *  * SendEmail静态类的Send方法用于发送邮件
 *  * SendEmail.Send(EmailAccount, EmailPassword, receiveMail, userRemarks, senderName, subjectText, mailText);
 */
public class EmailUtils {
    // https://www.cnblogs.com/xmqa/p/8458300.html
    // 发件人的 邮箱 和 密码（替换为自己的邮箱和密码）
    // PS: 某些邮箱服务器为了增加邮箱本身密码的安全性，给 SMTP 客户端设置了独立密码（有的邮箱称为“授权码”）,
    // 对于开启了独立密码的邮箱, 这里的邮箱密码必需使用这个独立密码（授权码）。
    // public static String myEmailAccount = "myEmailAccount";
    // public static String myEmailPassword = "myEmailPassword";

    // 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般(只是一般, 绝非绝对)格式为: smtp.xxx.com
    // 网易yeah邮箱的 SMTP 服务器地址为: smtp.yeah.net
    public static String myEmailSMTPHost = "smtp.163.com";

    // 网站链接地址
    private static final String linkString = "http://localhost:8080";

    // 收件人邮箱（替换为自己知道的有效邮箱）
    // public static String receiveMailAccount = "receiveMailAccount";

    /**
     * 创建邮件对象
     *
     * @param session
     *            和服务器交互的会话
     * @param receiveMail
     *            收件人邮箱
     * @param userRemarks
     *            用户备注
     * @param senderName
     *            发件人昵称
     * @param subjectText
     *            主题
     * @param MailText
     *            邮件正文
     * @param EmailAccount
     *            发件人邮箱
     * @return
     * @throws Exception
     */
    public static MimeMessage createMimeMessage(Session session, String receiveMail, String userRemarks,
                                                String senderName, String subjectText, String MailText, String EmailAccount) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(EmailAccount, senderName, "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, userRemarks, "UTF-8"));

        // 4. Subject: 邮件主题
        message.setSubject(subjectText, "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）
        message.setContent(MailText, "text/html;charset=UTF-8");
        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

    /**
     * * 创建一封只包含文本的简单邮件
     *
     * @param EmailAccount
     * 			  发件人邮箱账户  -- 需开通POP3、IMAP服务
     * @param EmailPassword
     * 			  发件人邮箱密码
     * @param receiveMail
     *            收件人邮箱
     * @param userRemarks
     *            用户备注
     * @param senderName
     *            发件人昵称
     * @param subjectText
     *            主题
     * @param mailText
     *            邮件正文
     * @return
     * @throws Exception
     */
    public static void Send(String EmailAccount, String EmailPassword, String receiveMail, String userRemarks,
                            String senderName, String subjectText, String mailText) {
        try {
            // 1. 创建参数配置, 用于连接邮件服务器的参数配置
            Properties props = new Properties(); // 参数配置
            props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
            props.setProperty("mail.smtp.host", myEmailSMTPHost); // 发件人的邮箱的 SMTP 服务器地址
            props.setProperty("mail.smtp.auth", "true"); // 需要请求认证

            // PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
            // 如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
            // 取消下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。
            /*
             * // SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接, // 需要改为对应邮箱的 SMTP
             * 服务器的端口, 具体可查看对应邮箱服务的帮助, // QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看) final String
             * smtpPort = "465"; props.setProperty("mail.smtp.port", smtpPort);
             * props.setProperty("mail.smtp.socketFactory.class",
             * "javax.net.ssl.SSLSocketFactory");
             * props.setProperty("mail.smtp.socketFactory.fallback", "false");
             * props.setProperty("mail.smtp.socketFactory.port", smtpPort);
             */

            // 2. 根据配置创建会话对象, 用于和邮件服务器交互
            Session session = Session.getInstance(props);
            // 设置为debug模式, 可以查看详细的发送 log
            session.setDebug(true);

            // 3. 创建一封邮件
            MimeMessage message = createMimeMessage(session, receiveMail, userRemarks, senderName, subjectText,
                    mailText, EmailAccount);

            // 4. 根据 Session 获取邮件传输对象
            Transport transport = session.getTransport();

            // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
            //
            // PS_01: 如果连接服务器失败, 都会在控制台输出相应失败原因的log。
            // 仔细查看失败原因, 有些邮箱服务器会返回错误码或查看错误类型的链接,
            // 根据给出的错误类型到对应邮件服务器的帮助网站上查看具体失败原因。
            //
            // PS_02: 连接失败的原因通常为以下几点, 仔细检查代码:
            // (1) 邮箱没有开启 SMTP 服务;
            // (2) 邮箱密码错误, 例如某些邮箱开启了独立密码;
            // (3) 邮箱服务器要求必须要使用 SSL 安全连接;
            // (4) 请求过于频繁或其他原因, 被邮件服务器拒绝服务;
            // (5) 如果以上几点都确定无误, 到邮件服务器网站查找帮助。
            //
            transport.connect(EmailAccount, EmailPassword);

            // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人,
            // 密送人
            transport.sendMessage(message, message.getAllRecipients());

            // 7. 关闭连接
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 简化的发送验证链接到邮箱的工具函数
     * @param request 请求
     * @param code 验证码，存于session，IPPZGCBOAEPQEYIE


     * @param email 注册填写的邮箱
     */
    public static void sendMessage(HttpServletRequest request, String username, String code, String email) {
        String url  = "http://" + request.getServerName() + ":" + request.getServerPort() + "" + request.getContextPath() + "/user/activeServlet?username=" + username + "&code=" + code;
        String mailText = "<html><head></head><body><h1>这是一封激活邮件,激活请点击以下链接</h1><h3><a href='" + url +
               "'>" + url + "</a></h3></body></html>";

        System.out.println(mailText);
        Send("chenloveyouabc@163.com", "IPPZGCBOAEPQEYIE", email, "备注", "个人音乐网站", "个人音乐网站激活", mailText);
    }
    public static void main(String[] args) {
    	 Send("chenloveyouabc@163.com", "IPPZGCBOAEPQEYIE", "2929836014@qq.com", "备注", "个人音乐网站", "个人音乐网站激活", "444");
	}
}
