public class ProcessAccountsController {

    public Boolean isShowProcess { get; set; }
    public List<Account> selectedAccounts { get; set; }
    
    public List<aAccount> accountList {get; set;}
    
    public ProcessAccountsController(){
        isShowProcess = false;
        selectedAccounts = new List<Account>();
    }
    
    public List<aAccount> getAccounts() {
        if(accountList == null) {
            accountList = new List<aAccount>();
            for(Account a: [select Id, Name, Phone from Account limit 30]) {
                accountList.add(new aAccount(a));
            }
        }
        return accountList;
    }
    public PageReference processSelected() {
        for(aAccount aAcc: getAccounts()) {
            if(aAcc.selected == true) {
                selectedAccounts.add(aAcc.acc);
            }
        }

        isShowProcess = true;
        accountList=null; // we need this line if we performed a write operation  because getContacts gets a fresh list now
        return null;
    }

    public class aAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
        
        public aAccount(Account a) {
            acc = a;
            selected = false;
        }
    }

}