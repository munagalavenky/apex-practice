public class EmailManager {
    public static void sendMail(string address, string subject, string body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[]{address};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        System.debug(mail);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail} );
        inspectResults(results);
    }
    
    public static boolean inspectResults(Messaging.SendEmailResult[] results){
        boolean sendResult = true;
        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                System.debug('Email Sent Successfully');
            }
            else{
                sendResult = false;
                System.debug('The follwing error occured'+ res.getErrors());
            }
        }
        return sendResult;
    }
}